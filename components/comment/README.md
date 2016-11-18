# Comment
Short description and motivation.

## 如何使用

In your model, add this line:

    class Post < ApplicationRecord
        has_many_comments
    end

In your controller, add this line:

    acts_as_commentable resource: Post
    
Or
    
    acts_as_commentable resource: :get_resource_of_comments

    def get_resource_of_comments
      Post.find(params[:id])
    end
    
Or
    
    acts_as_commentable resource: -> { Post.find(params[:id]) }

In your routes, add this line:

    resources :posts do
      commentable
    end

In your view file, add this line:

    <%= render_comments(resource, path: comments_post_path ) %>

In assets/javascripts/application.js, 注意，本插件需要Vue支持

    //= require vue
    //= require comments

In assets/stylesheets/application.css

    //= require comments    

## 查看使用效果

    cd spec/dummy
    rails s

## 自定义显示

复制components/comment/app/cells/comment/entry/show.slim在Rails项目app/cells/comment/entry/show.slim

访问 http://localhost:3000/posts

# 测试

本测试需要安装`geckodriver`, 在Mac上安装：`brew install geckodriver`

安装好之后，执行`rspec`

```ruby
gem 'comment'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install comment
```

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
