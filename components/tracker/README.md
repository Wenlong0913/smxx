# Tracker
Short description and motivation.

## Usage

### Simplest usage

in a controller, add this line:

    acts_as_trackable

With this simplest line, every action will be traced, Tracker knows what
user_id is by checking `current_user.id`, won't record resource and payload.

### Advanced usage

    acts_as_trackable user_id: :get_user_id,
      resource: :get_visit_resource,
      payload: :get_visit_payload,
      only: [:show]

    private

    def get_user_id
      current_user && current_user.id
    end

    def get_visit_resource
      @visit_resource
    end

    def get_visit_payload
      @visit_payload
    end
## views使用
- 引入js/css:

   > 注意: 在veiws中引用tracker模块前使用class为'tracker'的容器作为最外层容器，css/js才会生效

   > 需要vue.js

```
#= require tracker //js 引入
*= require tracker //css 引入

```
#### 1. 汇总功能页面
　
  > summary: true,页面导航选中＇数据总览＇

  > path: 处理得到json数据

  >　在views中引入

  ```
   .tracker
     == cell(Tracker::NavTopCell, nil, summary: true)
     == cell(Tracker::SummaryCell, nil, path: admin_tracker_url
  ```
#### 2. 访问统计－访问明细

  > visit: true，页面导航选中"访问统计"

  > path: 处理得到json数据

  >　在views中引入

  ```
    .tracker
      == cell(Tracker::NavTopCell, nil, visit: true)
      == cell(Tracker::VisitDetailedCell, nil, path: admin_tracker_visits_details_url)

  ```

#### 3. 访问统计－受访页面

  > path: 处理得到json数据

  > 在views中引入

  ```
  .tracker
    == cell(Tracker::NavTopCell, nil, visit: true)
    == cell(Tracker::VisitStatisticCell, nil, path: admin_tracker_visits_statistics_url)

  ```

#### 4. 分销统计

  > share: true, 页面导航选中＇分销统计＇

  > 在views中引入

  ```
  .tracker
    == cell(Tracker::NavTopCell, nil, share: true)
    == cell(Tracker::ShareStatisticCell, nil, path: admin_tracker_shares_url)

  ```

## controller 数据返回

```
# 根据view中引入cell时的path

# 汇总/数据总览

respond_to do |format|
  format.html
  format.json {render json: Tracker::Summary.report}
end

# 访问统计/访问明细

respond_to do |format|
  format.html
  format.json {render json: Tracker::Visit.visits(page: params[:page])}
end

# 访问统计/受访页面

respond_to do |format|
  format.html
  format.json {render json: Tracker::VisitStatistic.page_statistic}
end

```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'tracker'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install tracker
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
