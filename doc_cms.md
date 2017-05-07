# 什么是CMS站点

CMS站点是一个独立的网站内容管理系统， 每一个站点，对应public/templetes/下面的一个目录， 站点的所有资源（js/css.html.erb/image/video）都放在这个目录。

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
              |index.html.erb
              |about.html.erb
  </pre>

  2. 修改index.html.erb
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

  - 拆分 index.html.erb为：
    - _head.html.erb.erb
    - _foot.html.erb.erb
    - _header.html.erb.erb
    - _footer.html.erb.erb
    - temp_index.html.erb.erb
  - 修改资源引用路径

  创建CMS规则说明：
  <ul>
    <li>模版必须放在/public/templetes/目录下</li>
    <li>[首页]必须名为: index.html.erb</li>
    <li>[模版页]必须以"t_"或者"temp_"打头， 如 temp_blog_list.html.erb</li>
    <li>[内容页]保存一些特殊定义的页面, 如about.html.erb(关于我们), contact.html.erb(联系我们)</li>
  </ul>

# 数据初始化

  当新建一个网站的时候，可以同时初始化网站参数和栏目信息，具体操作是： 创建一个文件： /public/templetes/xxx/db_init.rb
  然后按照以下格式添加【网站参数】和【栏目】信息。

  注意： 文件名一定是： db_init.rb

      #/1. 添加网站参数
      @cms_site.keystores.find_or_create_by(key: 'yue-way', value: '打球', description: '约队中form表单标题')

      #/2. 添加栏目
      @cms_site.channels.create!(
        :parent_id    => nil,
        :title        => '首页',
        :short_title  => 'index',
        :properties   => 1,
        :tmp_index    => 'temp_index.html.erb.erb',
        :tmp_detail   => 'temp_detail.html.erb.erb',
        :keywords     => '首页，微场馆名称',
        :description  => '微场馆名称',
        :content      => '<p>大家好</p>'
      )


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
    <%= @cms_site.next_page(@page) %>
    <%= @cms_site.previous_page(@page) %>
    <%= raw @channel.description  %>
    <% @channel.pages.where("'recommend' = ANY(properties)").each do |page| %>

    <%= paginate @pages, remote: true %>


    <%= @cms_site.channels.where('parent_id is null').each do |channel| %>
      <%= get_menu(@cms_site, channel.short_title) %>
    <% end %>

## 添加表单

    <%= simple_form_for(Cms::Comment.new, url: cms_frontend_comment_create_path, html: { class: 'form-theme', id: 'formYue' } ) do |f| %>
        <input type="phone" name="comment[contact]" class="form-control" id="InputPhone" />
    <% end %>

可以使用的表单属性：

    contact: 联系方式
    name: 姓名
    mobile_phone: 手机号码
    tel_phone: 电话号码
    email: 电子邮件
    qq: QQ
    address: 地址
    gender: 性别
    birth: 出生日期
    hobby: 爱好
    content: 详细内容
    content2: 补充
    content3: 其它
    status: 状态
    branch: 分站
    datetime: 预订时间

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

## Dagle CMS项目本地开发教程
  1.在cms-templates下创建项目文件
    cms-templates克隆地址：git@gitlab.tanmer.com:tanmer/cms-templates.git

  2.关联本地cms-templates模板到dagle/public/templetes
    终端输入：ln -sf /home/wen/cms-templates /home/wen/dagle/public/templetes

  3.启动本地服务
    PROJECT_NAME=cms foreman start

  管理员admin权限操作：
    4.浏览器登录admin后台：www.lvh.me:5000/admin

    5.参数管理-新增系统参数-编辑['default','对应cms项目名称(met_llshg)']

    6.账户角色分工-用户-创建用户（添加商家姓名、手机号、密码（Kenrome001））

    7.浏览器登录agent后台：www.lvh.me:5000/admin

    8.新建系统名称（CMS采用项目名称(廖老四老火锅)）

    9.网站管理-添加站点-选择cms项目名称-站点名称-域名（llshg）

  用户agent权限操作：
    10.用户前台访问地址：llshg.lvh.me:5000浏览站点

    11.用户后台访问地址：llshg.lvh.me:5000/agent
