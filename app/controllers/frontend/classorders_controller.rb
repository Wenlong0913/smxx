class Frontend::ClassordersController < Frontend::BaseController
    before_action :ensure_login!
    acts_as_trackable user_id: :get_user_id, resource: :get_visit_resource, only: [:show]
    def new
        @class = Classorder.new
        @course = Course.find(params[:course_id]);
        @user = current_user
    end

    def create
      # 找到课程
      @course = Course.find(params[:classorder][:course_id])
      # 找到课程的对应报名余数
      remainder = @course.features["limit_number"][params[:classorder][:limitnu]]

      if remainder && remainder.to_i > 0

        @classorder = Classorder.new(user: current_user)
        @classorder.course_id = params[:classorder][:course_id]
        @classorder.name = params[:classorder][:name]
        @classorder.relname = params[:classorder][:relname]
        @classorder.site_id = params[:classorder][:site_id]
        @classorder.cardnu = params[:classorder][:cardnu]
        @classorder.teacher_name = params[:classorder][:teacher_name]
        @classorder.class_week = params[:classorder][:class_week]
        @classorder.class_day = params[:classorder][:class_day]
        @classorder.class_time = params[:classorder][:class_time]
        @classorder.class_place = params[:classorder][:class_place]
        @classorder.features = params[:classorder][:limitnu]
        @classorder.phone_number = current_user.mobile.phone_number

        if @classorder.save

          #如果选课成功就让人数减一
          @order_courses=ClassorderCourse.new
          @order_courses.course_id= params[:classorder][:course_id]
          @order_courses.classorder_id= @classorder.id
          @order_courses.save!

          @classorder.classorder_courses.each do |f|
            p = f.course
            limitnu =  @classorder.features
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
          render json: {errors:'本课程您已经选择过了，请选择其他课程'}
        end
      else
        render json: {errors:'名额已满，请选择其他课程'}
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
