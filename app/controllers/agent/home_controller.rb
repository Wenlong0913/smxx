class Agent::HomeController < Agent::BaseController
  def index
    @member_total_count = @site.members.count
    @preorder_conversition_total_count = @site.preorder_conversitions.count
    @order_total_count = @site.orders.count
    @market_page_total_count = @site.market_pages.count
  end
end
