class Frontend::BaseController < ApplicationController
  layout 'layouts/frontend'
  helper Cms::ApplicationHelper
  include Cms::ApplicationHelper
  before_action :load_cms_site

  private
  def load_cms_site
    @cms_site = Cms::Site.where("domain = ? OR root_domain = ?", request.subdomain, request.domain).first
    @cms_site ||= Cms::Site.first
  end
end
