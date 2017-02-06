class Api::V1::MaterialPurchasesController < Api::BaseController
  before_action :authenticate!

  def index
    authorize MaterialPurchase
    page_size = params[:page_size].present? ? params[:page_size].to_i : 20
    material_purchases =  params[:role].present? ? MaterialPurchase.with_role(params[:role]) : MaterialPurchase.all
    material_purchases = material_purchases.order(created_at: :desc).page(params[:page] || 1).per(page_size)
    render json: {
      material_purchases: material_purchase_json(material_purchases),
      page_size: page_size,
      current_page: material_purchases.current_page,
      total_pages: material_purchases.total_pages,
      total_count: material_purchases.total_count
    }
  end

  def create
    authorize MaterialPurchase
    flag, material_purchase = MaterialPurchase::Create.(permitted_attributes(MaterialPurchase))
    if flag
      render json: {status: 'ok', material_purchases: material_purchase_json(material_purchase)}
    else
      render json: {status: 'failed', error_message:  material_purchase.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  private
  def material_purchase_json(material_purchases)
    material_purchases.as_json(
      only: %w(id vendor_id status),
      methods: %w(purchase_date amount total),
      include: { 
        vendor: {
          only: %w(id name),
          methods: %w(contact_name phone_number)
        },
        material_purchase_details: {
          only: %w(material_id price number),
          include: {
            material: {
              only: %w(id name name_py)
            }
          }
        }
      }
    )
  end
end
