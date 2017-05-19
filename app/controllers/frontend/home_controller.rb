class Frontend::HomeController < Frontend::BaseController
  def index
    @news_channel = @cms_site.channels.find_by(short_title: 'news')
    @product = @site.products.first
  end
end
