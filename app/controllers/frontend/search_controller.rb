class Frontend::SearchController < Frontend::BaseController
  def search_result
    if params[:search][:keywords].presence
      @filter_products_colums = %w(name)
      @filter_cms_pages_colums = %w(title description)
      @filter_sites_colums = %w(title)
      @search_products_results = build_query_filter(Product.where("features ->>  'is_shelves' = ?", '1').all, only: @filter_products_colums).order(updated_at: :desc)
      @search_cms_pages_results = build_query_filter(Cms::Page.all, only: @filter_cms_pages_colums).order(updated_at: :desc)
      @search_sites_results = build_query_filter(Site.where("features ->> 'is_published' = ?", '1').all, only: @filter_sites_colums).order(updated_at: :desc)
      @search_results = @search_products_results + @search_cms_pages_results + @search_sites_results
    else
      @search_results = nil
    end
  end
end
