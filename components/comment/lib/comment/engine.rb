module Comment
  class Engine < ::Rails::Engine
    isolate_namespace Comment
    require 'comment/routes'
    initializer "comment.initialize" do
      ActiveSupport.on_load(:action_controller) do
        ActionController::Base.send(:include, Comment::ActsAsCommentable)
      end
    end
  end
end
