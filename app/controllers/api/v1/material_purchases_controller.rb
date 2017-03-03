class Api::V1::MaterialPurchasesController < Api::BaseController
  before_action :authenticate!
  before_action :set_material_purchase, only: [:update, :show, :audit]

  def index
    authorize MaterialPurchase
    page_size = params[:page_size].present? ? params[:page_size].to_i : 20
    material_purchases =  params[:role].present? ? MaterialPurchase.with_role(params[:role]) : MaterialPurchase.all
    material_purchases = material_purchases.order(created_at: :desc).page(params[:page] || 1).per(page_size)
    render json: {
      material_purchases: material_purchases_json(material_purchases),
      page_size: page_size,
      current_page: material_purchases.current_page,
      total_pages: material_purchases.total_pages,
      total_count: material_purchases.total_count
    }
  end

  def create
    authorize MaterialPurchase
    flag, material_purchase = MaterialPurchase::Create.(permitted_attributes(MaterialPurchase).merge(created_by: current_user.id))
    if flag
      render json: {status: 'ok', material_purchase: material_purchase_json(material_purchase)}
    else
      render json: {status: 'failed', error_message:  material_purchase.errors.full_messages.join(', ') }
    end
  end


  def update
    authorize @material_purchase
    import_flag = true
    if params["material_management"]
      import_flag, import_record = process_material_purchase_import
    end
    if import_flag
      @material_purchase.paid = @material_purchase.paid.to_f + params[:material_purchase][:paying].to_f
      flag, material_purchase = MaterialPurchase::Update.(@material_purchase, permitted_attributes(@material_purchase))
      if flag
        render json: {status: 'ok', material_purchase: material_purchase_json(material_purchase)}
      else
        render json: {status: 'failed', error_message:  material_purchase.errors.full_messages.join(', ') }
      end
    else
      render json: {status: 'failed', error_message:  import_record.errors.full_messages.join(', ') }
    end
  end

  def show
    authorize @material_purchase
    render json: {status: 'ok', material_purchase: material_purchase_json(@material_purchase)}
  end

  def audit
    authorize @material_purchase
    page_size = params[:page_size].present? ? params[:page_size].to_i : 20
    audits = @material_purchase.audits.order(created_at: :desc).page(params[:page] || 1).per(page_size)
    render json: {
      audits: audits_json(audits),
      detail_audits: detail_audits_json(@material_purchase.associated_audits),
      destory_materials: Material.where(id: @material_purchase.associated_audits.where(action: 'destroy').map{|a| a.audited_changes["material_id"]}).as_json(only: %w(id name)),
      page_size: page_size,
      current_page: audits.current_page,
      total_pages: audits.total_pages,
      total_count: audits.total_count
    }
  end

  private

  def material_purchases_json(material_purchases)
    material_purchases.as_json(
      only: %w(id vendor_id status),
      methods: %w(code purchase_date amount total paid),
      include: {
        vendor: {
          only: %w(id name),
          methods: %w(contact_name phone_number)
        }        
      }
    )    
  end

  def material_purchase_json(material_purchase)
    material_purchase.as_json(
      only: %w(id vendor_id status created_by),
      methods: %w(code purchase_date amount total paid delivery_date),
      include: { 
        vendor: {
          only: %w(id name),
          methods: %w(contact_name phone_number)
        },
        user: {
          only: %w(id nickname)
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

  def audits_json(audits)
    audits.as_json(
      only: %w(id action audited_changes created_at),
      include: {
        user: {
          only: %w(nickname)
        }
      }
    )
  end

  def detail_audits_json(audits)
    audits.as_json(
      only: %w(id action audited_changes created_at),
      include: {
        user: {
          only: %w(nickname)
        },
        auditable: {
          only: [],
          include: {
            material: {
              only: %w(name)
            }
          }
        }
      }
    )    
  end

  def set_material_purchase
    @material_purchase = MaterialPurchase.find(params[:id])
  end

  def process_material_purchase_import
    MaterialManagement::Create.(permitted_attributes(MaterialManagement))
  end
end
