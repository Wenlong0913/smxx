class ApplicationDecorator < SimpleDelegator
  def h
    ActionController::Base.helpers
  end

  def r
    Rails.application.routes.url_helpers
  end
end
