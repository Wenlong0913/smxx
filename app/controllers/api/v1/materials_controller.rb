class Api::V1::MaterialsController < Api::V1::BaseController
  before_action :authenticate!

  #
  # params:
  #   page: 页码
  # => per: 每页显示数目
  def index
    authorize Material
    render json: Material.all.page(params[:page]).per(params[:per])
  end
end
