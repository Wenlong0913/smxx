class ApplicationDecorator < SimpleDelegator

  def object
    __getobj__
  end

  def h
    ActionController::Base.helpers
  end

  def r
    Rails.application.routes.url_helpers
  end
end
