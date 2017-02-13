class Api::V1::VendorsController < Api::BaseController
  before_action :authenticate!

  def index
    authorize Vendor
    page_size = params[:page_size].present? ? params[:page_size].to_i : 20
    vendors = Vendor.all.order(created_at: :desc).page(params[:page] || 1).per(page_size)
    render json: {
      vendors: vendors.as_json(only: %w(id name)),
      page_size: page_size,
      current_page: vendors.current_page,
      total_pages: vendors.total_pages,
      total_count: vendors.total_count
    }
  end
end
