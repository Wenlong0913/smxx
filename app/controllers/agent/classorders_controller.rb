class Agent::ClassordersController < Agent::BaseController
  before_action :set_classorder, only: [:show, :edit, :update, :destroy]

  def index
    authorize Classorder
    
   # @classorders = Classorder.all.page(params[:page])
      @classorders = @site.classorders.all
      if params[:search].present?
        conditions = []
        query = []
        keywords = params[:search][:keywords]
        if !keywords.blank?
          query << "name like ?"
          conditions << "%" + keywords + "%"
        end
       
        conditions.unshift query.join(' and ')
        @classorders = @classorders.where(conditions)
      end
      
      @classorders = @classorders.order(updated_at: :desc)
       @classorders = @classorders.page(params[:page]).per(10)
  
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
      
      @classorder.courses.each do |f|
        
        @course=Course.find_by(id: f.id)
        
        if f.limit_number=="" || f.limit_number=="不限"|| f.limit_number=="无"
          
          @course.save! 
        else
          limit_number=f.limit_number.to_i+1                
          @course.limit_number=limit_number.to_s
          @course.save!                   
        end
      end
      
    end
    # Only allow a trusted parameter "white list" through.
    def classorder_params
      params[:classorder]
    end
end
