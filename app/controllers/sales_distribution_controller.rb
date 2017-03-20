class SalesDistributionController < ApplicationController
  def create
    obj = nil
    if params[:object].present?
      obj = eval(params[:object][:class]).where(id: params[:object][:id]).first
    end
    resource = SalesDistribution::Resource.find_or_create_by(
        type_name: params[:type_name],
        user: current_user,
        url: params[:url],
        object: obj
    )
    render json: {
      code: resource.code,
      share_path: URI(request.scheme + "://" + request.host + ":" + request.port.to_s).merge(resource.share_path).to_s
    }
  end
end
