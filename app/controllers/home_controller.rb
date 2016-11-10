class HomeController < ApplicationController
  acts_as_themeable :choose_theme

  def index
  end

private
  def choose_theme
    case params[:theme]
    when 'card' then 'card'
    when 'admin' then 'color_admin'
    else
      'color_admin'
    end
  end
end
