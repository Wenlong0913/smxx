module Tracker
  module ActsAsTrackable
    extend ActiveSupport::Concern

    def tracker_visit
      @_tracker_visit
    end

    def track_visit_wraper
      @_tracker_visit = Tracker::Visit.new
      yield
      @_tracker_visit.user_id ||= tracker__user_id
      @_tracker_visit.resource ||= tracker__resource
      @_tracker_visit.payload ||= tracker__payload
      @_tracker_visit.save
    end

    def tracker__user_id
      tracker__get_value(:user, Proc.new{ current_user.id })
    end

    def tracker__resource
      tracker__get_value(:resource)
    end

    def tracker__payload
      tracker__get_value(:payload)
    end

    def tracker__options
      @_tracker_visit_options
    end

    def tracker__get_value(key, default=nil)
      value = tracker__options.fetch(key, default)
      case value
      when Symbol
        send(value)
      when Proc
        value.()
      else
        value
      end
    end

    class_methods do
      def acts_as_trackable(options={})
        @_tracker_visit_options = options.dup
        around_action :track_visit_wraper, options.except(:user, :resource, :payload)

        define_method :track_visit__user do
          send 
        end
      end
    end
  end
end
