class Api::V1::ProducesController < Api::V1::BaseController
  before_action :authenticate!
  before_action :set_order, only: [:create]
  before_action :set_produces, only: [:index, :show]

  def index
    # authorize Produce
    page_size = params[:page_size] ? params[:page_size].to_i : 20
    @produces =  params["search_content"].present? ? @produces.joins(:order).where(orders: {code: params[:search_content]}) : @produces.all
    produces = @produces.order(updated_at: :desc).page(params[:page] || 1).per(page_size)
    produces_json = produces.all.as_json(
      only: [:id, :order_id, :status, :assignee_id, :created_at, :material_status],
      include: {
        order: {
          only: [:id, :code],
          include:{
            member: {only: [:name]},
            site: {only: [:title ]}
          },
        },
        tasks: {
          only: [:id, :assignee_id, :title, :description, :status, :resource_id, :ordinal],
          include: {task_type: {only: [:id, :name, :ordinal]}}
        }
      }
    )
    render json: render_base_data(produces_json, produces, page_size, @produce_list_type)
  end

  def show
    @produce = @produces.find(params[:id])
    # authorize @produce
    render json: @produce.as_json(
      only: [:id, :order_id, :status, :assignee_id, :created_at, :material_status],
      include: {
        order: {
          only: [:id, :code, :description, :internal_status],
          include:{
            member: {only: [:name]},
            site: {only: [:title ]},
            order_materials: {
              only: [:id, :amount, :factory_expected_number, :practical_number],
              include: {material: {only: [:id, :name, :name_py]}}
            },
            attachments: {only: [:id], methods: [:attachment_url, :attachment_file_name, :attachment_content_type]},
          },
        },
        tasks: {
          only: [:id, :assignee_id, :title, :description, :status, :resource_id, :ordinal],
          include: {task_type: {only: [:id, :name, :ordinal]}}
        }
      }
    )
  end

  def create
    authorize Produce

    produce = Produce.new(order: @order)
    if produce.save
      @order.update(internal_status: 'producing', update_by: current_user.id)
      render json: {status: 'ok', produce: produce.as_json(only: [:id])}
    else
      render json: {status: 'failed', error_message: produce.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
  end

  def need_export
    # authorize Produce
    produces = Produce.processing
    produces = produces.joins(order: [:order_materials]).includes(order: [:order_materials]).where("order_materials.factory_expected_number > order_materials.practical_number")
    produces_json = produces.as_json(
      only: [:id, :order_id],
      include: {
        order: {
          only: [:id, :code],
          include:{
            member: {only: [:name]},
            site: {only: [:title ]},
            order_materials: {
              only: [:id, :material_id, :amount, :factory_expected_number, :practical_number, :purchase_status],
              include: {
                material: {only: [:name, :name_py]}
              }
            }
          }
        }
      }
    )
    render json: {produces: produces_json}
  end

  def update
    produce = Produce.find(params[:id])
    authorize produce
    flag, produce = Produce::Update.(produce, permitted_attributes(produce))
    if flag
      render json: {status: 'ok', produce: produce}
    else
      render json: {status: 'failed', error_message: order.errors.full_messages.join(', ') }
    end
  end

  def destroy
    authorize Produce
    produce = Produce::Destroy.(params[:id])
    produce.order.packed!
    render json: {status: 'ok'}
  end

  private
    def set_order
      @order = Order.find(params[:order_id])
    end
    def set_produces
      @produce_list_type = params[:produce_list_type]
      @produces = case @produce_list_type
      when 'processing'
        Produce.processing
      when 'cancelled'
        Produce.cancelled
      when 'completed'
        Produce.completed
      else
        Produce.all
      end
    end
end
