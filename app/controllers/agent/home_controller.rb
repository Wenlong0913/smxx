class Agent::HomeController < Agent::BaseController
  skip_before_action :set_current_site

  def index
    if @site.nil?
      redirect_to new_agent_site_path and return
    end
    @member_total_count = @site.members.count
    @preorder_conversition_total_count = @site.preorder_conversitions.count
    @order_total_count = @site.orders.count
    @market_page_total_count = @site.market_pages.count
  end
end
