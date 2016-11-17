module Tracker
  class Engine < ::Rails::Engine
    isolate_namespace Tracker
    require 'cells'
    require 'cells-rails'
    require 'cells-slim'
    initializer "tracker.initialize" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, Tracker::ActsAsTrackable)
      end
    end
  end
end
