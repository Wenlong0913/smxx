class Api::V1::OrdersController < Api::BaseController
  before_action :authenticate!
  before_action :set_orders, only: [:index]
  before_action :set_order, only: [:show]

  def index
    authorize Order
    page_size = params[:page_size] ? params[:page_size].to_i : 20
    orders = params['search_content'].blank? ? @orders : @orders.where("code like :key", {key: ['%',params['search_content'].upcase, '%'].join})
    orders = orders.page(params[:page] || 1).per(page_size)
    orders_json = order_json(orders)
    render json: render_base_data(orders_json, orders, page_size, @order_list_type)
  end

  def create
    authorize Order
    flag, order = Order::Create.(permitted_attributes(Order))
    if flag
      render json: {status: 'ok', order: order_json(order)}
    else
      order.errors.messages.delete(:member)
      render json: {status: 'failed', error_message:  order.errors.messages.values.join(', ') }
    end
  end

  def show
    authorize @order
    render json: {status: 'ok', order: order_json(@order)}
  end

  # def create_comment
  #   authorize Order
  #   order_comment = @order.comments.new(params[:comment].permit(:content, :offer, :image_item_ids => [], :attachment_ids => []))
  #   order_comment.user = current_user
  #   if order_comment.save
  #     render json: {status: 'ok', comment: order_comment_json(order_comment)}
  #   else
  #     render json: {status: 'failed', error_message: 'failed'}
  #   end
  # end

  # def comments_index
  #   page_size = params[:page_size] ? params[:page_size].to_i : 20
  #   order_comments = @order.comments.order(created_at: :asc).page(params[:page] || 1).per(page_size)
  #   render json: {comments: order_comment_json(order_comments), current_page: order_comments.current_page, total_pages: order_comments.total_pages, total_count: order_comments.total_count}
  # end

  private
    def set_orders
      @order_list_type = params[:order_list_type]
      @orders = case @order_list_type
      when 'processing'
        Order.processing
      when 'cancelled'
        Order.cancelled
      when 'completed'
        Order.completed
      else
        Order.all
      end
    end

    def order_json(orders)
      orders.as_json(
        only: [:id, :code, :price, :status, :internal_status, :description, :created_at], 
        include: {
          site: {only: [:id, :title], include: { user: { only: [:nickname], include: { mobile: { only: [:phone_number] } } } }}, 
          member: {only: [:name]}, 
          produce: {only: [:id]},
          attachments: {only: [:id], methods: [:attachment_url, :attachment_file_name]}
        }
      )
    end

    def set_order
      @order = Order.find(params[:id])
    end

    # def order_comment_json(comment)
    #   comment.as_json(
    #     only: [:content, :created_at], methods: [:offer],
    #     include: {
    #       user: {only: [:nickname]},
    #       image_items: {only: [:id], methods: [:image_url, :image_file_name]},
    #       attachments: {only: [:id, :name], methods: [:attachment_url, :attachment_file_name]}
    #     }
    #   )
    # end
end
