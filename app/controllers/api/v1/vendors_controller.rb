class Api::V1::VendorsController < Api::BaseController
  before_action :authenticate!

  def index
    authorize Vendor
    page_size = params[:page_size].present? ? params[:page_size].to_i : 20
    vendors = Vendor.all.order(created_at: :desc).page(params[:page] || 1).per(page_size)
    render json: {
      vendors: vendor_json(vendors),
      page_size: page_size,
      current_page: vendors.current_page,
      total_pages: vendors.total_pages,
      total_count: vendors.total_count
    }
  end

  def create
    authorize Vendor
    flag, vendor = Vendor::Create.(permitted_attributes(Vendor))
    if flag
      render json: {status: 'ok', vendor: vendor_json(vendor)}
    else
      render json: {status: 'failed', error_message:  vendor.errors.full_messages.join(', ') }
    end
  end

  def vendor_json(vendor)
    vendor.as_json(
      only: %w(id name),
      methods: %w(phone_number contact_name)
    )
  end
end
