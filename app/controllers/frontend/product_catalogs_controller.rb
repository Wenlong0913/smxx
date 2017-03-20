class Frontend::ProductCatalogsController < ApplicationController
  def index
    @product_catalogs = ProductCatalog.all
  end

  def show
    @product_catalog = ProductCatalog.find(params[:id])
  end
end
