# csv support
require 'csv'
class Admin::MembersController < Admin::BaseController
  before_action :set_member, only: [:show, :edit, :update, :destroy]
  before_action :set_site, only:[:index, :new, :create, :destroy, :update, :show, :edit]

  # GET /admin/members
  def index
    authorize Member
    @filter_colums = %w(id name qq email)
    @members = build_query_filter(Member.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@members.to_json, filename: "members-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@members.to_xml, filename: "members-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@members.as_csv(only: []), filename: "members-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/members/1
  def show
    authorize @member
  end

  # GET /admin/members/new
  def new
    authorize Member
    @member = @site.members.new
  end

  # GET /admin/members/1/edit
  def edit
    authorize @member
  end

  # POST /admin/members
  def create
    authorize Member
    @member = @site.members.new(permitted_attributes(Member))

    if @member.save
      redirect_to admin_site_member_path(@site, @member), notice: 'Member 创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/members/1
  def update
    authorize @member
    if @member.update(permitted_attributes(@member))
      redirect_to admin_site_member_path(@site, @member), notice: 'Member 更新成功.'
    else
      render :edit
    end
  end

  # DELETE /admin/members/1
  def destroy
    authorize @member
    @member.destroy
    redirect_to admin_site_members_url(@site), notice: 'Member 删除成功.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    def set_site
      @site = Site.find(params[:site_id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_member_params
    #       #   params[:admin_member]
    #       # end
end
