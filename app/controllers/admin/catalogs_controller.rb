class Admin::CatalogsController < Admin::BaseController
  before_action :set_admin_catalog, only: [:edit, :update, :destroy]

  # GET /admin/catalogs
  def index
    authorize Catalog
    @admin_catalogs =
      if params[:id].present?
        Catalog.where(id: params[:id]).first.try{children}
      elsif params[:status].present?
        Catalog.all
      else
        Catalog.roots
      end
    array = {parent_id: params[:id]}
    array[:record] = @admin_catalogs.order(updated_at: :desc).map{|catalog| {id: catalog.id, name: catalog.name}}
    respond_to do |format|
      format.html
      format.json {render json: array}
    end
  end

  # GET /admin/catalogs/1
  def show
    authorize @admin_catalog
  end

  # GET /admin/catalogs/new
  def new
    authorize Catalog
    @admin_catalog = Catalog.new
  end

  # GET /admin/catalogs/1/edit
  def edit
    authorize @admin_catalog
  end

  # POST /admin/catalogs
  def create
    authorize Catalog
    @admin_catalog = Catalog.new(admin_catalog_params)
    if @admin_catalog.save
      render json: {status: 'Catalog 创建成功.'}
    else
      render json: {status: 'Catalog 创建失败.'}
    end
  end

  # PATCH/PUT /admin/catalogs/1
  def update
    authorize @admin_catalog
    if @admin_catalog.update(admin_catalog_params)
      render json: {status: 'Catalog 更新成功.'}
    else
      render json: {status: 'Catalog 更新失败.'}
    end
  end

  # DELETE /admin/catalogs/1
  def destroy
    authorize @admin_catalog
    @admin_catalog.destroy
    render js: "$.gritter.add({title: '提示', text: 'Catalog 删除成功.'});"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_catalog
      @admin_catalog = Catalog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_catalog_params
      params.permit(:parent_id, :name, :position)
    end
end
