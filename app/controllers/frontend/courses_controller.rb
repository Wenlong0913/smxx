class Frontend::CoursesController < Frontend::BaseController
  before_action :ensure_login!
  #前台首页
  def index
    @news_channel = @cms_site.channels.find_by(short_title: 'index')
    @class = Classorder.all
    @course = Course.all
    @course1 = @course.order(created_at: :desc)
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

