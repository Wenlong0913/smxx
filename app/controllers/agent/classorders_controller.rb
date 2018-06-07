class Agent::ClassordersController < Agent::BaseController
  before_action :set_classorder, only: [:show, :edit, :update, :destroy]

  def index
    authorize Classorder 
   # @classorders = Classorder.all.page(params[:page])
      @classorders = @site.classorders.all
      @filter_colums = %w(id name)
      if params[:search] && params[:search][:keywords]
        @classorders = build_query_filter(@classorders, only: @filter_colums).order(updated_at: :desc).page(params[:page]).per(10)
      end
      @classorders=  @classorders.page(params[:page])
      respond_to do |format|
        if params[:json].present?
          # format.json { render json: {:users => @orders.select(:id, :nickname), :total => @orders.size} }
          format.html { send_data(@classorders.to_json, filename: "classorders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
        elsif params[:xml].present?
          format.html { send_data(@classorders.to_xml, filename: "classorders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
        elsif params[:csv].present?
          # as_csv =>  () | only: [] | except: []
          format.html { send_data(@classorders.as_csv(), filename: "classorders-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
        else
          format.html
          format.json { render json: {:results => @classorders.as_json(only: [:id, :code]), :total => @classorders.size} }
        end
      end
  
  end
  def show
    authorize @classorder
    respond_to do |format|
      format.html
      format.json { render json: @classorder }
    end
  end

  def new
    authorize Classorder
    @classorder = Classorder.new(classorder_params)
  end

  def edit
    authorize @classorder
  end

  def create
    authorize Classorder
    @classorder = Classorder.new(permitted_attributes(Classorder))

    respond_to do |format|
      format.html do
        if @classorder.save
          redirect_to agent_classorder_path(@classorder), notice: 'Classorder 创建成功.'
        else
          render :new
        end
      end
      format.json { render json: @classorder }
    end

  end

  def update
    authorize @classorder
    respond_to do |format|
      format.html do
        if @classorder.update(permitted_attributes(@classorder))
          redirect_to agent_classorder_path(@classorder), notice: 'Classorder 更新成功.'
        else
          render :edit
        end
      end
      format.json { render json: @classorder }
    end
  end

  def destroy
    authorize @classorder
   if limit_number
      @classorder.destroy
   end
   
    respond_to do |format|
      format.html { redirect_to agent_classorders_url, notice: 'Classorder 删除成功.' }
      format.json { head 200 }
    end

  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classorder
      @classorder = Classorder.find(params[:id])
    end
    def limit_number
      @classorder.classorder_courses.each do |f|
        p = f.course
        limitnu = @classorder.features
        if  p.limit_number[limitnu]== "" ||  p.limit_number[limitnu]=="不限" ||  p.limit_number[limitnu] == "无"
            p.save!
        else
            p.limit_number[limitnu] = p.limit_number[limitnu].to_i + 1
            p.save!  
        end           
    end
      
    end
    # Only allow a trusted parameter "white list" through.
    def classorder_params
      params[:classorder]
    end
end
