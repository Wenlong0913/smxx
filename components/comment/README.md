# Comment
Short description and motivation.

## Usage

In your controller, add this line:

    acts_as_commentable resource: -> { Post.find(params[:id]) }

In your routes, add this line:

    resources :posts do
      commentable
    end

## Installation
Add this line to your application's Gemfile:

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
