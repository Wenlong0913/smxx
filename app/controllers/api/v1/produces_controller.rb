class Api::V1::ProducesController < Api::V1::BaseController
  before_action :authenticate!
  before_action :set_order, only: [:create]
  before_action :set_produces, only: [:index]

  def index
    authorize Produce
    page_size = params[:page_size] ? params[:page_size].to_i : 20
    produces = @produces.all.page(params[:page] || 1).per(page_size)
    produces_json = produces.all.as_json(
      only: [:id, :order_id, :status, :assignee_id, :created_at],
      include: {
        order: {
          only: [:id, :code],
          include:{
            member: {only: [:name]}}
          },
        tasks: {
          only: [:id, :assignee_id, :title, :description, :status, :resource_id],
          include: {task_type: {only: [:id, :name, :ordinal]}}
        }
      }
    )
    render json: render_base_data(produces_json, produces, page_size, @produce_list_type)
  end

  def create
    authorize Produce

    produce = Produce.new(order: @order)
    if produce.save
      render json: {status: 'ok', produce: produce.as_json(only: [:id])}
    else
      render json: {status: 'failed', error_message: produce.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
    end
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
