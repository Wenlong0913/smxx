class HomeController < ApplicationController
  acts_as_trackable only: :index
  def index
  end

end
