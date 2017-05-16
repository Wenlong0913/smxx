class InviteLinkController < ApplicationController
  layout false
  def show
    share_code = params[:sc]
    @resource = SalesDistribution::Resource.find_by(code: share_code)
    unless @resource
      head 404
      return
    end
    case @resource.type_name
    when '用户注册'
      render :register
    end
  end
end
