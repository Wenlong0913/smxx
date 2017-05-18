# csv support
require 'csv'
class Admin::ArticlesController < Admin::BaseController
  before_action :set_community
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /admin/articles
  def index
    authorize Article
    @filter_colums = %w(id title)
    @articles = build_query_filter(@community.articles.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@articles.to_json, filename: "articles-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@articles.to_xml, filename: "articles-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@articles.as_csv(only: []), filename: "articles-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/articles/1
  def show
    authorize @article
  end

  # GET /admin/articles/new
  def new
    authorize Article
    @article = Article.new
  end

  # GET /admin/articles/1/edit
  def edit
    authorize @article
  end

  # POST /admin/articles
  def create
    authorize Article
    @article = Article.new(permitted_attributes(Article).merge(community_id: @community.id, author: current_user.id))

    if @article.save
      redirect_to admin_community_article_path(@community, @article), notice: "#{Article.model_name.human} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/articles/1
  def update
    authorize @article
    if @article.update(permitted_attributes(@article))
      redirect_to admin_community_article_path(@community, @article), notice: "#{Article.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/articles/1
  def destroy
    authorize @article
    @article.destroy
    redirect_to admin_community_articles_url, notice: "#{Article.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_article_params
    #       #   params[:admin_article]
    #       # end
    def set_community
      @community = Community.find(params[:community_id])
    end
end
