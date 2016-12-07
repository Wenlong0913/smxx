class Admin::CatalogsController < Admin::BaseController
  before_action :set_admin_catalog, only: [:show, :edit, :update, :destroy]

  # GET /admin/catalogs
  def index
    authorize Catalog
    @admin_catalogs = Catalog.all.order(updated_at: :desc)
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
      redirect_to admin_catalog_path(@admin_catalog), notice: 'Catalog 创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/catalogs/1
  def update
    authorize @admin_catalog
    if @admin_catalog.update(admin_catalog_params)
      redirect_to admin_catalog_path(@admin_catalog), notice: 'Catalog 更新成功.'
    else
      render :edit
    end
  end

  # DELETE /admin/catalogs/1
  def destroy
    authorize @admin_catalog
    @admin_catalog.destroy
    redirect_to admin_catalogs_url, notice: 'Catalog 删除成功.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_catalog
      @admin_catalog = Catalog.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_catalog_params
      params.require(:catalog).permit(:parent_id, :name, :position)
    end
end
