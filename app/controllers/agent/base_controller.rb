class Agent::BaseController < ApplicationController
  acts_as_themeable 'color_admin'
  layout 'layouts/agent'

  before_action :ensure_agent_user!
  before_action :set_current_site

  def set_current_site
    @site = Site.find_by(user_id: current_user.id)
    if @site.nil? && params[:controller] == 'agent/sites'
      redirect_to new_agent_site_path
    end
  end

  def ensure_agent_user!
    redirect_to admin_sign_in_url unless current_user && (current_user.has_role?(:agent) || current_user.super_admin_or_admin?)
  end
end
