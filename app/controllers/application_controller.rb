class ApplicationController < ActionController::Base
  helper FontAwesome::Rails::IconHelper
  helper :enum_i18n
  include Pundit
  include QueryFilterControllerConcern
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  impersonates :user
  before_action :check_subdomain!

  #render 404 error
  def not_found!
    raise ActionController::RoutingError.new('Not Found')
  end

  private
  def user_not_authorized
    flash[:alert] = "没有访问权限"
    redirect_to(request.referrer || root_path)
  end

  def check_subdomain!
    return if @cms_site.present?
    return if ["", "www", "api"].include?(request.subdomain)
    if Subdomain.matches?(request) && Cms::Site.find_by(domain: request.subdomain)
      @cms_site = Cms::Site.find_by(domain: request.subdomain)
    end
  end

end
