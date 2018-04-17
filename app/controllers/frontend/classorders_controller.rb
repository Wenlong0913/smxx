class Frontend::ClassordersController < Frontend::BaseController
    before_action :ensure_login!
    acts_as_trackable user_id: :get_user_id, resource: :get_visit_resource, only: [:show]
    def new
        @class = Classorder.new
        @course = Course.find(params[:course_id]);  
        @user = current_user
    end
    def create
        @class = Classorder.new(user: current_user)
        @class.course_id = params[:classorder][:course_id]
        @class.name = params[:classorder][:name]
        @class.relname = params[:classorder][:relname]
        @class.site_id = params[:classorder][:site_id]
        @class.cardnu = params[:classorder][:cardnu]
        @class.teacher_name = params[:classorder][:teacher_name]
        @class.class_week = params[:classorder][:class_week]  
        @class.class_day = params[:classorder][:class_day]
        @class.class_time = params[:classorder][:class_time]
        @class.class_place = params[:classorder][:class_place] 
        @class.features = params[:classorder][:limitnu]    
        if @class.save
           
            
        #如果选课成功就让人数减一
            @order_courses=ClassorderCourse.new
            @order_courses.course_id= params[:classorder][:course_id]
            @order_courses.classorder_id= @class.id
            @order_courses.save! 

            @class.classorder_courses.each do |f|
                p = f.course
                limitnu =  @class.features
                if p.limit_number[limitnu]== "" || p.limit_number[limitnu]== "不限"|| p.limit_number[limitnu] == "无"
                    p.save!
                    flash[:notice] = '选课成功' 
                    redirect_to self_classorder_users_path
                else 
                    p.limit_number[limitnu] = p.limit_number[limitnu].to_i - 1
                    p.save! 
                    flash[:notice] = '选课成功' 
                    redirect_to self_classorder_users_path
                end
                    
            end
            
        else
            render json: {errors:'本课程您已经选择过了,请选择其他课程'}
        end   
    end
    
    def destroy
        @class = Classorder.find(params[:id])
        if limit_number
             #如果撤课成功就让人数加一
            @class.destroy
        end   
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
    def limit_number
        @class.classorder_courses.each do |f|
            p = f.course
            limitnu =  @class.features
            if  p.limit_number[limitnu] == "" ||  p.limit_number[limitnu] =="不限"||  p.limit_number[limitnu] == "无"
                p.save!
                respond_to do |format|
                    format.html { redirect_to frontend_courses_path, notice: '撤销课程成功' }
                    format.json { head 200 }
                end
            else
                p.limit_number[limitnu] = p.limit_number[limitnu].to_i + 1
                p.save! 
                respond_to do |format|
                    format.html { redirect_to frontend_courses_path, notice: '撤销课程成功' }
                    format.json { head 200 }
                end
            end           
        end
    end
   
end


