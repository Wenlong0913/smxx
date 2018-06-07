class Frontend::CoursesController < Frontend::BaseController
  before_action :ensure_login!
  #前台首页
  def index
    @news_channel = @cms_site.channels.find_by(short_title: 'index')
    @class = Classorder.all
    @course = Course.all
    @course = @course.where("name like ?", "%#{params['q']}%") if params["q"].present?
    if params[:search] && params[:search][:keywords]
      # binding.pry
      @course = @course.where("name like :key OR course_type like :key ", {key: "%#{params[:search][:keywords]}%"})
    end
    @course = @course.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.json { render json: {:results => @course.select(:id, :name), :total => @course.size} }
    end
    @user = current_user
  end

  def show 
    @course = Course.find(params[:id])
  end
  
  private
  def ensure_login!
      redirect_to admin_sign_in_path unless current_user
  end
  
end

