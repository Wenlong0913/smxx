class Api::V1::MembersController < Api::BaseController
  before_action :authenticate!
  before_action :set_site, only: [:index]

  def index
    authorize Member
    members = @site.members
    member_json = member_json(members)
    render json: {json_data: member_json}
  end

  private

    def set_site
      @site = Site.where(id: params[:site_id]).first
    end

    def member_json(members)
      members.as_json(
        only: [:id, :name, :qq, :email, :gender, :birth]
      )
    end
end
