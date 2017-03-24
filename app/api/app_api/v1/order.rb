module AppAPI::V1
  class Order < Grape::API
    helpers AppAPI::SharedParams
    resources :orders do

      desc '订单信息' do
        success AppAPI::Entities::Order
      end
      params do
        requires :id, type: Integer, desc: '订单ID'
      end
      get ':id' do
        authenticate!
        present current_user.orders.find(params[:id]), with: AppAPI::Entities::Order, includes: [:order_products, :products]
      end

      desc "订单创建" do
        success AppAPI::Entities::Order 
      end
      params do
        requires :site_id, type: Integer, desc: '店铺ID'
        requires :shopping_cart_ids, type: Array[Integer], coerce_with: ->(val) { val.split(/,|，/).map(&:to_i) }, desc: '购物车ID列表'
      end
      post do
        authenticate!
        order = current_user.orders.new(site_id: params[:site_id])
        shopping_carts = ::ShoppingCart.where(id: params[:shopping_cart_ids])
        shopping_carts.each do |sc|
          order.order_products.new(product_id: sc.product_id, price: sc.price, amount: sc.amount)
        end
        error! order.errors unless order.save && shopping_carts.destroy_all
        present order, with: AppAPI::Entities::Order, includes: [:order_products, :products]
      end

      desc "删除订单" do
        success AppAPI::Entities::Order 
      end
      params do
        requires :id, type: Integer, desc: '订单ID'
      end
      delete do
        authenticate!
        order = current_user.orders.find(params[:id]).destroy
        present order, with: AppAPI::Entities::Order
      end 

      desc '获取订单列表' do
        success AppAPI::Entities::Order.collection
      end
      params do
        use :pagination
        use :sort, fields: [:id, :created_at, :updated_at]
        optional :status, type: String, values: ['processing', 'cancelled', 'completed'], desc: '订单状态：付款中，已付款，已取消，已完成'
      end
      get do
        authenticate!
        orders = current_user.orders
        if params[:status]
          orders = orders.send(params[:status])
        end
        orders = paginate_collection(sort_collection(orders), params)
        wrap_collection orders, AppAPI::Entities::Order, includes: [:order_products, :products]
      end

    end # end of resources
  end
end
