class Frontend::SearchController < Frontend::BaseController
  def search_result
    if params[:type] == nil || params[:type] == 'products'
      @filter_colums = %w(name)
      @search_results = build_query_filter(Product.where("features ->>  'is_shelves' = ?", '1').all, only: @filter_colums).order(updated_at: :desc).page(params[:page])
    end

    if params[:type] == 'cms_pages'
      @filter_colums = %w(title description)
      @search_results = build_query_filter(@cms_site.pages.all, only: @filter_colums).order(updated_at: :desc).page(params[:page])
    end

    if params[:type] == 'sites'
      @filter_colums = %w(title)
      @search_results = build_query_filter(Site.where("features ->> 'is_published' = ?", '1').all, only: @filter_colums).order(updated_at: :desc).page(params[:page])
    end
  end
end
