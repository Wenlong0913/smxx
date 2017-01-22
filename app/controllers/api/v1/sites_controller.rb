class Api::V1::SitesController < Api::BaseController
  before_action :authenticate!

  def index
    render json: { sites: Site.all.as_json(only: [:id, :title])}
  end
end
