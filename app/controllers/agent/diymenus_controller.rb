class Agent::DiymenusController < Agent::BaseController
  before_action :set_site
  before_action :set_diymenu, only: [:show, :edit, :update, :destroy]

  # GET /diymenus
  def index
    @page_name = 'diymenus_index'
    @diymenus = @site.diymenus
  end

  # GET /diymenus/new
  def new
    @diymenu = @site.diymenus.new
  end

  # GET /diymenus/1/edit
  def edit
  end

  # POST /diymenus
  def create
    @diymenu = @site.diymenus.new(diymenu_params)

    if @diymenu.save
      redirect_to agent_diymenus_path, notice: '菜单创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /diymenus/1
  def update
    if @diymenu.update(diymenu_params)
      redirect_to agent_diymenus_path, notice: '菜单修改成功.'
    else
      render :edit
    end
  end

  # DELETE /diymenus/1
  def destroy
    @diymenu.destroy
    redirect_to agent_diymenus_path, notice: '删除菜单成功.'
  end

  def sort
    state = JSON.parse(params[:state])
    enabled_menus, disabled_menus = state

    save_sorted_menus enabled_menus, true
    save_sorted_menus disabled_menus, false
    render json: { action: :sort }
  end

  def upload
    result = @site.upload_menu
    render json: {
      action: :upload,
      msg: result.body
    }
  end

  def download
    @site.download_menu!
    flash[:notice] = '下载成功.'
    render js: "Turbolinks.visit('#{agent_diymenus_path}');"
  rescue ApiError::FailedResult => ex
    render json: { action: :download, error: "#{ex.message} - #{ex.result.cn_msg}" }
  end

  def connect_mp_callback
    conn = Faraday.new(:url => 'https://wxopen.tanmer.com')
    if params[:code] 
      code = params[:code]
      response = conn.get("api/mp/token?code=#{code}&name=#{@site.title}")
      data = JSON.parse(response.body)
      @site.tanmer_wxopen_token = data['token']
      @site.save!
      redirect_to agent_diymenus_path
    elsif params[:site][:tanmer_wxopen_token]
      submit_token = params[:site][:tanmer_wxopen_token]
      conn.headers[Faraday::Request::Authorization::KEY] = "Bear #{submit_token}"
      response = conn.get("api/mp/info")
      data = JSON.parse(response.body)
      if data['code'] == -1
        render js: "alert('输入的token错误');"
      else
        @site.tanmer_wxopen_token = submit_token
        @site.save!
        redirect_to agent_diymenus_path
      end
    end
  end

  private

    def save_sorted_menus(state, enabled)
      Array(state).each_with_index do |parent_menu, i|
        parent_id = parent_menu['id']
        @site.diymenus.where(id: parent_id).update_all(parent_id: nil, is_show: enabled, sort: i)
        Array(parent_menu['children']).flatten.each_with_index do |sub_menu, j|
          @site.diymenus.where(id: sub_menu['id']).update_all(parent_id: parent_id, is_show: enabled, sort: j)
        end
      end
    end

    def set_site
      @site = Site.find_by(user_id: current_user.id)
      not_found! if @site.nil?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_diymenu
      @diymenu = @site.diymenus.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def diymenu_params
      params.require(:diymenu).permit(:button_type, :name, :key, :url, :is_show, :sort)
    end
end
