class Agent::BaseController < ApplicationController
  acts_as_themeable 'color_admin'
  layout 'layouts/agent'

  before_action :set_current_site

  def set_current_site
    @site = Site.find_by(user_id: current_user.id)
    not_found! if @site.nil?
  end
end
