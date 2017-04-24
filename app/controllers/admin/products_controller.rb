# csv support
require 'csv'
class Admin::ProductsController < Admin::BaseController
  before_action :set_products
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_site, only: [:index, :new, :edit, :create, :show, :update, :destroy]
  before_action :set_site_tags, only: [:edit, :new]

  def dashboard
    authorize Product
  end

  # GET /admin/products
  def index
    authorize Product
    @filter_colums = %w(id)
    @products = @site.products
    @products = build_query_filter(@products, only: @filter_colums).page(params[:page])
    respond_to do |format|
      if params[:json].present?
        format.html { send_data(@products.to_json, filename: "products-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.json") }
      elsif params[:xml].present?
        format.html { send_data(@products.to_xml, filename: "products-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.xml") }
      elsif params[:csv].present?
        # as_csv =>  () | only: [] | except: []
        format.html { send_data(@products.as_csv(only: []), filename: "products-#{Time.now.localtime.strftime('%Y%m%d%H%M%S')}.csv") }
      else
        format.html
      end
    end
  end

  # GET /admin/products/1
  def show
    authorize @product
  end

  # GET /admin/products/new
  def new
    authorize Product
    @product = Product.new
  end

  # GET /admin/products/1/edit
  def edit
    authorize @product
  end

  # POST /admin/products
  def create
    authorize Product
    @product = Product.new(permitted_attributes(Product).merge(site_id: @site.id))
    filter_additional_attribute
    if @product.save
      redirect_to admin_site_product_path(@site, @product), notice: 'Product 创建成功.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/products/1
  def update
    authorize @product
    filter_additional_attribute
    if @product.update(permitted_attributes(@product))
      redirect_to admin_site_product_path(@site, @product), notice: 'Product 更新成功.'
    else
      render :edit
    end
  end

  # DELETE /admin/products/1
  def destroy
    authorize @product
    @product.destroy
    redirect_to admin_site_products_url, notice: 'Product 删除成功.'
  end

  private

    def set_products
      if params[:site_id].present?
        @products = Product.where(site_id: params[:site_id])
      else
        @products = Product.all
      end
    end

    def set_product
      @product = @products.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    # def admin_product_params
    #       #   params.require(:admin_product).permit(policy(@admin_product).permitted_attributes)
    #       # end

    def set_site_tags
      @tags_all = current_user.sites.first.tags.pluck(:name).uniq
      @most_used_tags = current_user.sites.first.tags.most_used(5).uniq.map(&:name)
    end

    def set_site
      @site = Site.find(params[:site_id])
    end
    
    def filter_additional_attribute
      if params[:product][:additional_attribute_keys].present?
        params[:product][:additional_attribute_keys].each_pair do |k, v|
          if v.blank?
            params[:product][:additional_attribute_keys].delete(k)
            params[:product][:additional_attribute_values].delete(k)
          end
        end
      end
      if params[:product][:additional_attribute_keys].present?
        @product.additional_attribute_keys = params[:product][:additional_attribute_keys]
        @product.additional_attribute_values = params[:product][:additional_attribute_values]
      end
    end
end
