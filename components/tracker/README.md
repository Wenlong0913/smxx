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
