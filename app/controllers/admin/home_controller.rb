class Admin::HomeController < ApplicationController
  acts_as_themeable 'color_admin'
  def index
  end
end
