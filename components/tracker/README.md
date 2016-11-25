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
### 在view中引入(slim写法):

  > - 注意: 在veiws中引用tracker模块前使用class为'tracker'的容器作为最外层容器，css/js才会生效


#### 1. 汇总功能页面
　
  > summary: true,页面导航选中＇数据总览＇

  > @collect_visits: 汇总shuj,@chart_data: ip/访客曲线图形数据(即将移除，改为vue/json)

  >　在views中引入

  ```
  .tracker
    == cell(Tracker::NavTopCell, nil, summary: true)
    == cell(Tracker::SummaryCell, @collect_visits, chart_data: @chart_data)
  ```
#### 2. 访问统计功能页面－访问明细

  > visit: true，页面导航选中"访问统计"

  > @visits: 数据部分(即将移除，改为vue/json)

  >　在views中引入

  ```
  .tracker
    == cell(Tracker::NavTopCell, nil, visit: true)
    == cell(Tracker::VisitDetailedCell, @visits)
  ```

#### 3. 访问统计功能页面－受访页面


  > @visits_data: 数据部分(即将移除，改为vue/json)

  > 在views中引入

  ```
  .tracker
    == cell(Tracker::NavTopCell, nil, visit: true)
    == cell(Tracker::VisitStatisticCell, @visits_data)
  ```

#### 4. 分销统计


  > share: true, 页面导航选中＇分销统计＇

  > 在views中引入

  ```
  .tracker
    == cell(Tracker::NavTopCell, nil, share: true)
    == cell(Tracker::ShareStatisticCell)
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
