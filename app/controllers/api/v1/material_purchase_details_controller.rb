# 物料管理

class Api::V1::MaterialPurchaseDetailsController < Api::V1::BaseController
  before_action :authenticate!

  def destroy
    material_purchase_detail = MaterialPurchaseDetail.find(params[:id])
    authorize material_purchase_detail
    MaterialPurchaseDetail::Destroy.(material_purchase_detail)
    render json: {status: 'ok', material_purchases: material_purchase_json(material_purchase_detail.material_purchase)}
  end

  def update
    material_purchase_detail = MaterialPurchaseDetail.find(params[:id])
    authorize material_purchase_detail
    flag, material_purchase_detail = MaterialPurchaseDetail::Update.(material_purchase_detail, permitted_attributes(material_purchase_detail))
    if flag
      render json: {status: 'ok', material_purchase: material_purchase_json(material_purchase_detail.material_purchase)}
    else
      render json: {status: 'error'}
    end
  end

  private

  private
  def material_purchase_json(material_purchases)
    material_purchases.as_json(
      only: %w(id vendor_id status),
      methods: %w(purchase_date amount total paid),
      include: { 
        vendor: {
          only: %w(id name),
          methods: %w(contact_name phone_number)
        },
        material_purchase_details: {
          only: %w(id material_id price number input_number),
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
