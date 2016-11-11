class Admin::HomeController < Admin::BaseController
  acts_as_themeable 'color_admin'

  def index
  end
end
