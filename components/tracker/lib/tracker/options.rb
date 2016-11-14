module Tracker
  class Options
    attr_accessor :user_id, :resource, :payload
    attr_reader :origin_options

    def initialize(origin_options)
      @origin_options = origin_options.freeze
    end

    def user_id
      get_value(:user_id, Proc.new{ defined?(current_user) && current_user && current_user.id })
    end

    def resource
      get_value(:resource)
    end

    def payload
      get_value(:payload)
    end

    private
    def get_value(key, default=nil)
      value = origin_options.fetch(key, default)
      case value
      when Symbol
        send(value)
      when Proc
        value.()
      else
        value
      end
    end
  end
end
