class Frontend::ClassordersController < Frontend::BaseController
    before_action :ensure_login!
    acts_as_trackable user_id: :get_user_id, resource: :get_visit_resource, only: [:show]
    
    def index
        @class = Classorder.all
    end
    def new
        redirect_to binding_phone_users_url(return_url: new_frontend_classorder_url(courses_id: params[:courses_id])) unless current_user.try(:mobile).try(:phone_number)
        @class = Classorder.new
        @course = Course.find(params[:course_id]);      
        @user = current_user
    end
    def create
        ActiveRecord::Base.transaction do
            @class = Classorder.new
            @class.course_id = params[:classorder][:course_id]
            @class.user_id = params[:classorder][:user_id]
            @class.name = params[:classorder][:name]
            @class.features = params[:classorder][:limit_number]
            @class.relname = params[:classorder][:relname]
            @class.cardnu = params[:classorder][:cardnu]
            @class.teacher_name = params[:classorder][:teacher_name]
            @class.weeknu = params[:classorder][:weeknu]
            @class.class_week = JSON.parse(params[:classorder][:class_week].gsub(/=>/,':'))   
            @class.class_day = JSON.parse(params[:classorder][:class_day].gsub(/=>/,':'))
            @class.class_time = JSON.parse(params[:classorder][:class_time].gsub(/=>/,':'))
            @class.class_place = JSON.parse(params[:classorder][:class_place].gsub(/=>/,':'))    
            if @class.save
            flash[:notice] = '选课成功'
            redirect_to frontend_classorders_path
            else
                render json: {errors:'本课程您已经选择过了,请选择其他课程'}
            end
            params[:classorder][:classorder_courses].each do |classorder_course_params|
                classorder_course = @class.classorder_courses.build
                classorder_course.course_id = classorder_course_params[:id]
                classorder_course.amount = classorder_course_params[:amount] 
                classorder_course.save!
            end
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
        @class.destroy
        respond_to do |format|
            format.html { redirect_to frontend_courses_path, notice: '撤销课程成功' }
            format.json { head 200 }
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


