module Tracker
  class Engine < ::Rails::Engine
    isolate_namespace Tracker
    initializer "tracker.initialize" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, Tracker::ActsAsTrackable)
      end
    end
  end
end
