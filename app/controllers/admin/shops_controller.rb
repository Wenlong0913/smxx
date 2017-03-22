# csv support
require 'csv'
class Admin::ShopsController < Admin::BaseController
  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  # GET /admin/shops
  def index
    authorize Shop
    @filter_colums = %w(id)
    @shops = build_query_filter(Shop.all, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@shops.to_json, filename: "shops-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@shops.to_xml, filename: "shops-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@shops.as_csv(only: []), filename: "shops-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/shops/1
  def show
    authorize @shop
  end

  # GET /admin/shops/new
  def new
    authorize Shop
    @shop = Shop.new
  end

  # GET /admin/shops/1/edit
  def edit
    authorize @shop
  end

  # POST /admin/shops
  def create
    authorize Shop
    @shop = Shop.new(permitted_attributes(Shop))

    if @shop.save
      redirect_to admin_shop_path(@shop), notice: "#{Shop.model_name.human} 创建成功."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/shops/1
  def update
    authorize @shop
    if @shop.update(permitted_attributes(@shop))
      redirect_to admin_shop_path(@shop), notice: "#{Shop.model_name.human} 更新成功."
    else
      render :edit
    end
  end

  # DELETE /admin/shops/1
  def destroy
    authorize @shop
    @shop.destroy
    redirect_to admin_shops_url, notice: "#{Shop.model_name.human} 删除成功."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_shop_params
    #       #   params[:admin_shop]
    #       # end
end
