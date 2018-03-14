class HomeController < ApplicationController
  def index
  end

  def healthz
    render plain: 'OK'
  end
end
