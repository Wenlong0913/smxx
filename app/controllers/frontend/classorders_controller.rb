class Frontend::ClassordersController < Frontend::BaseController
    before_action :ensure_login!
    acts_as_trackable user_id: :get_user_id, resource: :get_visit_resource, only: [:show]
    
    def index
        @class = Classorder.all
    end
    def new
        @class = Classorder.new
        @course = Course.find(params[:course_id]);  
        @user = current_user
    end
    def create
       
            @class = Classorder.new(user: current_user)
            @class.course_id = params[:classorder][:course_id]
            @class.name = params[:classorder][:name]
            @class.features = params[:classorder][:limit_number]
            @class.relname = params[:classorder][:relname]
            @class.site_id = params[:classorder][:site_id]
            @class.cardnu = params[:classorder][:cardnu]
            @class.teacher_name = params[:classorder][:teacher_name]
            @class.class_week = JSON.parse(params[:classorder][:class_week].gsub(/=>/,':'))   
            @class.class_day = JSON.parse(params[:classorder][:class_day].gsub(/=>/,':'))
            @class.class_time = JSON.parse(params[:classorder][:class_time].gsub(/=>/,':'))
            @class.class_place = JSON.parse(params[:classorder][:class_place].gsub(/=>/,':'))    
            if @class.save
            #如果选课成功就让人数加一
            @course = Course.find(params[:classorder][:course_id]);
            @course.features["limit_number"] = ((@course.features["limit_number"]).to_i - 1 ).to_s
            @course.save!
            flash[:notice] = '选课成功' 
            redirect_to self_classorder_users_path
            else
                render json: {errors:'本课程您已经选择过了,请选择其他课程'}
            end 
      
    end
    def show
        @class = Classorder.find(params[:id])
        respond_to do |format|
            format.html
            format.json { render json: @class }
          end
    end
    def destroy
        @class = Classorder.find(params[:id])
       if @class.destroy
         #如果撤课成功就让人数减一
        @course =  @class.course_id
        @course1 = Course.find(@course)
        @course1.features["limit_number"] = ((@course1.features["limit_number"]).to_i + 1 ).to_s
        @course1.save!
            respond_to do |format|
                format.html { redirect_to frontend_courses_path, notice: '撤销课程成功' }
                format.json { head 200 }
            end
        else
            render json: {errors:'撤销课程失败'}
        end
    end

    def showtable
        @class = Classorder.all
    end
    private
    def ensure_login!
        redirect_to admin_sign_in_path unless current_user
    end
    def get_user_id
        current_user && current_user.id
    end
      
    def get_visit_resource
        @class
    end
   
end


