# 开发文档

- [开发配置](#config)
- [模块介绍](#modules-list)
  - [Decorator](#module-decorator)
  - [Loading](#module-loading)
  - [Catalog(分类显示和管理)](webpack/components/catalog/README.md)
  - [imageUpload(图片上传)](webpack/components/image_upload/README.md)
  - [imageSelect(图片选择+多图片上传)](webpack/components/image_select/README.md)
  - [imageAlbum(图片集显示)](webpack/components/image_album/README.md)
  - [multiImageUpload(多图片上传)](webpack/components/multi_image_upload/README.md)
  - [modal(模态框)](webpack/components/modal/README.md)
  - Rails模块
      - [Decorator](#module-decorator)

  - Vue组件
      - [Loading（页面Loading动画）](webpack/components/loading/README.md)
      - [Backdrop（半透明蒙版）](webpack/components/backdrop/README.md)
      - [Catalog(分类显示和管理)](webpack/components/catalog/README.md)
      - [imageUpload(图片上传)](webpack/components/image_upload/README.md)
      - [imageSelect(图片选择+多图片上传)](webpack/components/image_select/README.md)
      - [imageAlbum(图片集显示)](webpack/components/image_album/README.md)
      - [multiImageUpload(多图片上传)](webpack/components/multi_image_upload/README.md)
      - [modal(模态框)](webpack/components/modal/README.md)

- [如何开始工作](#get-started)
  - [怎么生成一个Model](#how-to-generate-model)
  - [怎么生成一个Item](#how-to-generate-item)
  - [怎么生成一个Controller](#how-to-generate-controller)
  - [View中怎么使用Decorator](#how-to-use-decorator)
  - [View中获得Enum字段的中文列表](#how-to-get-enum-i18n-from-view)
- [Helper中的一些方法](#helper-methods)
- [Model中的一些用法](#how-to-program-model)
    - [数据验证](#how-to-program-model-validators)
- [测试](#testing)
- [CMS建站](doc_cms.md)
- [营销页](doc_market_page.md)
- [CRM客户管理](doc_member.md)
- [Keystore系统参数设置](doc_keystore.md)
<a name="config"></a>
## 开发配置

    bundle install # 安装Gem
    npm install # 安装nodejs的各种依赖保，Vue+webpack需要这些文件
    foreman start

### 如果要分别启动

<a name="modules-list"></a>
## 模块介绍

1. 评论模块
2. 统计模块

<a name="module-decorator"></a>
### Decorator，可以给Model数据添加一些可呈现在前端网页的属性

因为Gem `drapper` 是一个成熟的Decorator,但是他不支持Rails 5，所以我们自己写个组件实现这个功能

所在目录： `components/decorator`，[查看文档](components/decorator/README.md)

<a name="get-started"></a>
## 如何开始工作

<a name="how-to-generate-model"></a>
### 怎么生成一个Model

    rails g model Thing

这个方法会自动生产标准Model相关文件外，还额外生成：

- CUD文件（Create/Update/Destroy)
  - app/models/thing/create.rb
  - app/models/thing/update.rb
  - app/models/thing/destroy.rb
- Decorator文件
  - app/decorators/thing_decorator.rb
- Pundit的Policy文件
  - app/policies/thing_policy.rb
- 使用Audited，记录所有数据变化
  - app/models/thing.rb 中加入 audited

能够生产以上文件，都是在`config/application.rb`的`generators`中配置的。

    generators do |app|

      require 'rails/generators/base'
      require 'generators/base_concern'
      Rails::Generators::Base.send :include, Generators::BaseConcern

      require 'rails/generators/rails/scaffold_controller/scaffold_controller_generator'
      require 'generators/modulize_template_concern'
      Rails::Generators::ScaffoldControllerGenerator.send :include, Generators::ModulizeTemplateConcern

      require 'rails/generators/rails/model/model_generator'
      require 'generators/model_concern'
      Rails::Generators::ModelGenerator.send :include, Generators::ModelConcern

      Rails::Generators::ModelGenerator.hook_for :cud, default: 'cud'
      Rails::Generators::ModelGenerator.hook_for :decorator, default: 'decorator'
      Rails::Generators::ModelGenerator.hook_for :pundit, default: true, as: 'policy', in: 'pundit'
    end

<a name="how-to-generate-item"></a>
### 怎么生成一个Item
项目默认有Item表，是所有物件的基类表，当我们需要定义一个高级的物件时，例如定义一个Album类：

    rails g item Album people description
      create  app/models/album.rb
      invoke  cud
      create    app/models/album/create.rb
      create    app/models/album/update.rb
      create    app/models/album/destroy.rb
      invoke    rspec
      create      rspec/models/album/create_spec.rb
      create      rspec/models/album/update_spec.rb
      create      rspec/models/album/destroy_spec.rb
      invoke  decorator
      create    app/decorators/album_decorator.rb
      invoke    rspec
      create      spec/decorators/album_spec.rb
      invoke  rspec
      create    spec/models/album_spec.rb
      invoke    factory_girl
      create      spec/factories/albums.rb

`app/models/album.rb`的内容是这样的：

    class Album < Item
      store_accessor :features, :people, :description
    end


<a name="how-to-generate-controller"></a>
### 怎么生产一个Controller

    rails g scaffold_controller Thing

    这个方法会自动生产标准Model相关文件外，但是会用到我们自定义的模版：

    - Controller模版
      - lib/templates/rails/scaffold_controller/controller.rb
      - lib/templates/rails/scaffold_controller/admin/controller.rb
      - lib/templates/rails/scaffold_controller/others/controller.rb
    - View模版
      - lib/template/slim/scaffold/color_admin/admin

能够用到以上文件，都是在`config/application.rb`的`generators`中配置的。

    config.generators do |g|
      # Themeable options
      g.theme_scaffold_mapping = {
        admin: { theme: 'color_admin', theme_scaffold: 'admin' },
        agent: { theme: 'card', theme_scaffold: 'admin' }
    }

<a name="how-to-use-decorator"></a>
### View中怎么使用Decorator

首先，`rails g model`会自动生产一个`app/decorators/xxx_decorator.rb`文件，你可以在该文件中添加想让View页面访问的方法。


然后，在View中，使用`decorate(@record)`生产一个Decorator实例，该实例是通过`@record`的类型，自动找到对应的Decorator, 如：

在`app/decorators/site_decorator.rb`中，是这样定义的：

    class SiteDecorator < ApplicationDecorator
      def created_at
        time_ago_in_words(object.created_at) + "之前"
      end

      def display_name
        h.content_tag :span, "> #{name}"
      end

      def link_button
        h.link_to name, r.site_path(object), class: 'btn btn-sm btn-default'
      end
    end

在`app/views/sites/show.slim`中：

    @record = Site.first
    - decorate(@record) do |site|
      h2 Name
      span = site.display_name
      h2 Created at
      span = site.created_at
      = site.link_button

这里的`decorate`方法是定义在`app/helpers/decorator_helper.rb`。`ApplicationDecorator`是定义在`app/decorators/application_decorator.rb`中，这个文件中可以看到，`SiteDecorator`可以使用`h`调用view helper方法，用`r`调用路由方法。

<a name="how-to-get-enum-i18n-from-view"></a>
### View中获得Enum字段的中文列表

我们在`app/helpers/enum_i18n_helper.rb`中提供了两个方法，方便获取enum字段的i18n翻译：

- `enum_l(user, :approval_state)`获取实例的`approval_state`翻译
- `enum_options_for_select(User, :approval_state)`获取`approval_state`的所有翻译列表，提供给select显示

    # app/model/user.rb
    class User < ActiveRecord::Base
      enum approval_state: { unprocessed: 0, approved: 1, declined: 2 }
    end
    # config/locales/activerecord.en.yml
    en:
      activerecord:
        attributes:
          user:
            approval_states:
              unprocessed: "Unprocessed"
              approved: "Approved"
              declined: "Declined"
    # in view
    <%= enum_l(user, :approval_state) %>
    <div class="form-group">
       <%= f.label :approval_state %>
       <%= f.select :approval_state, enum_options_for_select(User, :approval_state) %>
     </div>


<a name="helper-methods"></a>
## Helper中的一些方法

- ApplicationHelper

    `page?(*paths)`判断是否当前页

      `page?('admin/products')` => check controller path is 'admin/products'  
      `page?('admin/products#index')` => check controller path is 'admin/products' and action_name is 'index'  
      `page?('admin/products#show?id=1')` => check controller_path is 'admin/products', action_name is 'show' and id is 1  

<a name="how-to-program-model"></a>
## Model中的一些用法

在`app/models/concerns`目录，有一些对Model的扩展方法：

- `cast_pinyin_for(*attrs)`

    把一个字段转换为拼音首字母，然后存到字段`xxx_py`中

- `User.all.as_csv(only: [:id, :name])`

    把一个查询导出为csv

<a name="how-to-program-model-validators"></a>
### 数据验证

目前定义了两个自定义验证：

`app/validators/email_validator.rb`
`app/validators/mobile_phone_validator.rb`

- 验证电子邮件

      class User < ApplicationRecord
        validates :email, email: true
      end

- 验证手机号

      class User < ApplicationRecord
        validates :mobile_phone, mobile_phone: true
      end

- 验证QQ号

      class User < ApplicationRecord
        validates :qq_number, qq: true
      end

<a name="testing"></a>
## 测试

运行测试代码，因为需要测试feature，需要用到浏览器插件`capybara`和`selenium-webdriver`，
Mac系统必须执行`brew install geckodriver`安装插件`geckodriver`

在feature, controller, request测试中，需要测试用户登录后的效果：
`spec/support/controller_macros.rb`中有三种用户登录

- login_user
- login_admin
- login_agent

如果需要登录一个制定用户，用`login_user(User.find(1))`，使用方法如：

    RSpec.feature "Toggles", type: :feature, js: true do
      login_user
      it { ... }
    end
