# 什么是CMS站点

CMS站点是一个独立的网站内容管理系统， 每一个站点，对应public/templetes/下面的一个目录， 站点的所有资源（js/css/html/image/video）都放在这个目录。

# 如何创建一个CMS站点

  1. 将站点目录复制到public/templetes/目录下，站点的结构大致如下：
  <pre>
    public/templetes
          |templete_name
              |assets
                    |css
                    |js
                    |font
                    |img
              |images
              |index.html
              |about.html
  </pre>

  2. 修改index.html
  <p>首页作为模版的统一入口，所有公共的css、js、导航、页脚等部分都从首页里面提取出来。</p>
    <ul>
      <li>
        <p>用下面的标记分别把需要提取的部分标记出来</p>
        <p>&gt;head&lt;部分公共代码（一般是css文件）</p>
        <pre>
          &lt;!-- [[head start]] --&gt;
            ...
          &lt;!-- [[head end]] --&gt;
        </pre>
        <p>网页底部公共代码(一般是js文件和统计代码等)</p>
        <pre>
          &lt;!-- [[foot start]] --&gt;
            ...
          &lt;!-- [[foot end]] --&gt;
        </pre>
        <p>公共导航部分，页头</p>
        <pre>
          &lt;!-- [[header start]] --&gt;
            ...
          &lt;!-- [[header end]] --&gt;
        </pre>
        <p>页脚公共部分，如友情链接、版权信息等</p>
        <pre>
          &lt;!-- [[footer start]] --&gt;
            ...
          &lt;!-- [[footer end]] --&gt;
        </pre>
      </li>
    </ul>

  3. 运行： /templetes/generate_templetes.rb -e themlete_name

    generate_templetes.rb实现了以下几个功能：

  - 拆分 index.html为：
    - _head.html.erb
    - _foot.html.erb
    - _header.html.erb
    - _footer.html.erb
    - temp_index.html.erb
  - 修改资源引用路径

  创建CMS规则说明：
  <ul>
    <li>模版必须放在/public/templetes/目录下</li>
    <li>[首页]必须名为: index.html</li>
    <li>[模版页]必须以"t_"或者"temp_"打头， 如 temp_blog_list.html</li>
    <li>[内容页]保存一些特殊定义的页面, 如about.html(关于我们), contact.html(联系我们)</li>
  </ul>

# 模板页面设计

模板页面中，可以访问的方法见app/controllers/cms_controller.rb

公共实例：

    @cms_site
    @channel
    @page
    @pages

公共方法：

    get_date(date)
    get_cms_url(obj, params = {}) #obj: Cms::Page, Cms::Channel, String(short_title)

引用实例：

    <%= @cms_site.name %>
    <%= @cms_site.value_for('contact_name') %>
    <%= raw @channel.description  %>
    <% @channel.pages.where("'recommend' = ANY(properties)").each do |page| %>
    <%= paginate @pages, remote: true %>

# 如何添加二级域名

## 本地代码实现：

涉及文件：

    lib/subdomain.rb
    app/controllers/application_controller.rb
    app/controllers/cms_controller.rb
    app/controllers/home_controller.rb
    app/helpers/url_helper.rb
    config/routes/cms_frontend_route.rb

本地测试方法：
> 使用lvh.me提供的办法， 如： http://subdomain.lvh.me:5000/

> 注意：在本地浏览器测试的时候，请关闭浏览器的代理模式

## 域名配置

Dnspod域名解析添加：

`* A  120.132.67.49`

Nginx config:

`server_name *.dagle.cn;`

那么，如果在Cms中修改一个站点(site)的域名(domain)值为： cms, 则可以通过如下二级域名访问： [cms.dagle.cn](http://cms.dagle.cn)

## 添加页面访问统计

1. 给表添加统计字段(migration)

  add_column :cms_pages, :impressions_count, :integer, default: 0

2. 修改Model:

  is_impressionable :counter_cache => true

3. 修改Controller

WidgetsController < ApplicationController
  impressionist :actions=>[:show,:index]
end

或者在action里定义：

impressionist(@channel, "channel_#{@channel.id}")
impressionist(@page, "page_#{@page.id}") if @page # 2nd argument is optional

4. 在View中引用：

IP次数：  <%= cms_page.impressions_count %>
PV次数：  <%= cms_page.impressionist_count %>
