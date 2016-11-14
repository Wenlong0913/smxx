module Tracker
  class Engine < ::Rails::Engine
    isolate_namespace Tracker
    config.to_prepare do
      ActionController::Base.send :include, Tracker::ActsAsTrackable
    end
  end
end
