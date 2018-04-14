class Admin::TeachersController < Admin::BaseController
  before_action :set_teachers
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :set_site, only: [:new, :edit, :create, :show, :update, :destroy]
  def index
    authorize Teacher
    # @teachers = Teacher.all.page(params[:page])
    @filter_colums = %w(id)
    @teachers = if params[:site_id]
                  @site = Site.find(params[:site_id])
                  @site.teachers
                else
                  Teacher.all
                end
    @teachers = build_query_filter(@teachers, only: @filter_colums).order(updated_at: :desc).page(params[:page])

    respond_to do |format|
      format.html
      format.json { render json: @teachers }
    end
  end

  def show
    authorize @teacher

  end

  def new
    authorize Teacher  
    @teacher = Teacher.new
  end

  def edit
    authorize @teacher
  end

  def create
    authorize Teacher
   
    @teacher = Teacher.new(permitted_attributes(Teacher).merge(site_id: @site.id))
    if @teacher.save
      redirect_to admin_site_teacher_path(@site, @teacher), notice: 'Teacher 创建成功.'
    else
      render :new
    end
  end

  def update
    authorize @teacher
    if @teacher.update(permitted_attributes(@teacher))
      redirect_to admin_site_teacher_path(@site, @teacher), notice: 'Teacher 更新成功.'
    else
      render :edit
    end
  end

  def destroy
    authorize @teacher
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to admin_site_teachers_url, notice: 'Teacher 删除成功.' }
      format.json { head 200 }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params[:teacher]
    end
    def set_teachers
      if params[:site_id].present?
        @teachers = Teacher.where(site_id: params[:site_id])
      else
        @teachers = Teacher.all
      end

    end

    def set_teacher
      @teacher = @teachers.find(params[:id])
    end

    def set_site
      
      @site = Site.find(params[:site_id])
    end
   
end
