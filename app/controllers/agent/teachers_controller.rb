class Agent::TeachersController < Agent::BaseController
  before_action :set_teachers
  before_action :set_current_user_teachers
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :set_site_tags, only: [:edit, :new]
  
  before_action :set_site, only: [:new, :edit, :create, :show, :update, :destroy]
  def index
    authorize Teacher
    # @teachers = Teacher.all.page(params[:page])
    @filter_colums = %w(id)
    @teachers = if @site.id
                  @site = Site.find(@site.id)
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
    binding.pry
  end

  def create
    authorize Teacher
  #  binding.pry
    @teacher = Teacher.new(permitted_attributes(Teacher).merge(site_id: @site.id))
    if @teacher.save
      redirect_to agent_teacher_path(@teacher), notice: 'Teacher 创建成功.'
    else
      render :new
    end
  end

  def update
    authorize @teacher
    if @teacher.update(permitted_attributes(@teacher))
      redirect_to agent_teacher_path( @teacher), notice: 'Teacher 更新成功.'
    else
      render :edit
    end
  end

  def destroy
    authorize @teacher
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to agent_teachers_url, notice: 'Teacher 删除成功.' }
      format.json { head 200 }
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_current_user_teachers
      @teachers = @site.teachers
    end
    # Only allow a trusted parameter "white list" through.
    def teacher_params
      params[:teacher]
    end
    def set_teachers
      if @site.id.present?
        @teachers = Teacher.where(site_id: @site.id)
      else
        @teachers = Teacher.all
      end

    end

    def set_teacher
      @teacher = @teachers.find(params[:id])
    end
    def set_site_tags
      @site_tags      = @site.tags.pluck(:name).uniq
      @site_most_tags = @site.tags.most_used(5).uniq.map(&:name)
    end
    def set_site
      #binding.pry
      @site = Site.find(@site.id)
    end
    def get_user_id
      current_user && current_user.id
    end
end
