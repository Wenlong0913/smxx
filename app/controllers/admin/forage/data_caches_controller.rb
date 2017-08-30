# csv support
require 'csv'
class Admin::Forage::DataCachesController < Admin::Forage::BaseController
  before_action :set_forage_data_cache, only: [:show, :edit, :update, :destroy]
  before_action :get_matched_source, only: [:edit, :update]

  # GET /admin/forage/data_caches
  def index
    authorize ::Forage::DataCache
    @filter_colums = %w(title migrate_to)
    @forage_data_caches = Forage::DataCache.all.order(is_merged: :asc, created_at: :asc)
    @forage_data_caches = build_query_filter(@forage_data_caches, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@forage_data_caches.to_json, filename: "forage_data_caches-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@forage_data_caches.to_xml, filename: "forage_data_caches-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@forage_data_caches.as_csv(only: []), filename: "forage_data_caches-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/forage/data_caches/1
  def show
    authorize @forage_data_cache
    @merge_url = @forage_data_cache.merged? ? source_redirect_url : nil
  end

  # GET /admin/forage/data_caches/1/edit
  def edit
    authorize @forage_data_cache
  end

  # PATCH/PUT /admin/forage/data_caches/1
  def update
    authorize @forage_data_cache
    Forage::DataCache.transaction do
      # generate source(site or product or cms_page)
      generate_source

      if @merge_source.save && @forage_data_cache.update(permitted_attributes(@forage_data_cache).merge({
           processed_by: current_user.id,
           is_merged: "merged",
           source: @merge_source,
           matched_status: 'only_one',
           matched_id: @merge_source.id}))
        redirect_to source_redirect_url, notice: "#{Forage::DataCache.model_name.human} 合并成功."
      else
        @forage_data_cache.errors.add :source, @merge_source.errors.full_messages.join(', ')
        ActiveRecord::Rollback
        render :edit
      end
    end
  end

  # DELETE /admin/forage/data_caches/1
  def destroy
    authorize @forage_data_cache
    @forage_data_cache.cancelled!
    redirect_to admin_forage_data_caches_url, notice: "#{Forage::DataCache.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forage_data_cache
      @forage_data_cache = ::Forage::DataCache.find(params[:id])
    end
end
