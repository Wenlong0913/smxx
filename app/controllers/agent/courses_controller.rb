require 'csv'
class Agent::CoursesController < Agent::BaseController
  before_action :set_courses
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_teacher_id, only: [:create,:update]
  before_action :set_site, only: [:new, :edit, :create, :show, :update, :destroy,:course_table]
  before_action :set_site_tags, only: [:edit, :new]
   def index
    authorize Course
    # @courses = Course.all.page(params[:page])
    @filter_colums = %w(id name)
    @courses = if @site.id
                  @site = Site.find(@site.id)
                  @site.courses
                else
                  Course.all
                end
    @courses = build_query_filter(@courses, only: @filter_colums).order(updated_at: :desc).page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @courses }
    end
  end

  def show
    authorize @course
    respond_to do |format|
      format.html
      format.json { render json: @course }
      format.png do
        qrcode = RQRCode::QRCode.new(wechat_orders_micro_website_url(course_id: @course.id))
        send_data qrcode.as_png(
          resize_gte_to: false,
          resize_exactly_to: false,
          fill: 'white',
          color: 'black',
          size: 240,
          border_modules: 4,
          module_px_size: 6,
          file: nil
        )
      end
    end

  end

  def new
    authorize Course
    @course = Course.new
    @teacher=Teacher.where(site_id: @site.id)
   
  end

  def edit
    authorize @course
    @teacher=Teacher.where(site_id: @site.id)
  end

  def create
    authorize Course
    @teacher=Teacher.where(site_id: @site.id)
     
    @course = Course.new(permitted_attributes(Course).merge(site_id: @site.id).merge(teacher_id: @teachers.id))
    @course.site = @site
  
    filter_week 
    filter_day 
    filter_time 
    filter_place 
    if @course.save
      redirect_to agent_course_path( @course), notice: 'Course 创建成功.'
    else
      render json: {errors: @course.errors.full_messages.join(',')}
    end

    
  end

  def update
    authorize @course
    @teacher=Teacher.where(site_id: @site.id)
    filter_week
    filter_day 
    filter_time 
    filter_place 
    if @course.update(permitted_attributes(@course).merge(teacher_id: @teachers.id))
      redirect_to agent_course_path(@course), notice: 'Course 更新成功.'
    else
      render :edit
    end
  end

  def destroy
    authorize @course
    @course.destroy
    respond_to do |format|
      format.html { redirect_to agent_courses_url, notice: 'Course 删除成功.' }
      format.json { head 200 }
    end

  end
  def course_table
    authorize Course
    @teacher=Teacher.where(site_id: @site.id)
    @courses = if @site.id
    @site = Site.find(@site.id)
    @site.courses
  else
    Course.all
  end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_teacher_id
      @teachers=Teacher.find_by(name: params[:course][:teacher_name])
    end
    def set_courses
      if params[:site_id].present?
        @courses = Course.where(site_id: @site.id)
      else
        @courses = Course.all
      end

    end
    def set_site
      
      @site = Site.find(@site.id)
    end
    def set_course
      @course = @courses.find(params[:id])
    end
    def set_site_tags
      @site_tags      = @site.tags.pluck(:name).uniq
      @site_most_tags = @site.tags.most_used(5).uniq.map(&:name)
    end
    # Only allow a trusted parameter "white list" through.
    def course_params
      params.require(:course).permit(:name,:type,:introduction)
    end
    def filter_week 
      if params[:course][:class_week].present?
        
        @course.class_week = params[:course][:class_week]
      end
    end
    def filter_day 
      if params[:course][:class_day].present?
        
        @course.class_day = params[:course][:class_day]
      end
    end
    def filter_time
      if params[:course][:class_time].present?
        
        @course.class_time = params[:course][:class_time]
      end
    end
    def filter_place 
      if params[:course][:class_place].present?
        
        @course.class_place = params[:course][:class_place]
      end
    end

end
