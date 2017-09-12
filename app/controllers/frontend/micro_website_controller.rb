class Frontend::MicroWebsiteController < Frontend::BaseController
  before_action :ensure_wechat_login!, except: [:wechat_login]
  def index
    @products = Product.where("features ->> 'is_shelves' = ?", '1').all
    @sites = Site.where("features ->> 'is_published' = ?", '1').all
  end

  def wechat_sites
    @sites = Site.all
    @site_catalogs = SiteCatalog.all.order(updated_at: :desc).page(params[:page])
    if params[:catalog_id]
      @site_catalog =SiteCatalog.find(params[:catalog_id])
      @sites = @site_catalog.sites
    end
    @sites = @sites.order(updated_at: :desc).page(params[:page])
  end

  def wechat_products
    @product_catalogs = ProductCatalog.all.order(updated_at: :desc)
    if params[:id].present?
      @product_catalog = ProductCatalog.find(params[:id])
      @products = @product_catalog.products
    else
      @products = Product.all
    end
    @products = @products.where("features ->> 'status' = ?", params[:type]) if %w(pending open completed closed).include?(params[:type])
    @products = @products.order(updated_at: :desc).page(params[:page])
  end

  def wechat_news
    @pages = @cms_site.channels.find_by(short_title: 'wechat').pages.order(updated_at: :desc).page(params[:page])
  end

  def wechat_new
    @page = Cms::Page.find(params[:id])
  end

  def wechat_product
    @product = Product.find(params[:id])
  end

  def wechat_site
	  @site = Site.find(params[:id])
	end

  def wechat_login
    if params[:code]
      conn = Faraday.new(:url => Settings.weixin_login.host)
      response = conn.get('/wx/mp_auth/%s/fetch_uid/%s' % [Settings.weixin_login.appid, params[:code]])
      data = JSON.parse(response.body)
      if data['uid']
        weixin = User::Weixin.find_or_create_by(uid: data['uid'])
        if current_user
          current_user.weixin = weixin
        else
          user = weixin.user || User.new(nickname: weixin.name, password: 'tanmer.com')
          user.weixin = weixin
          user.save
          sign_in user
          redirect_to micro_website_index_url
        end
      end
    end
  end

  private
    # wechat_login_micro_website_url
    def ensure_wechat_login!
      return if current_user
      conn = Faraday.new(:url => Settings.weixin_login.host)
      appid = Settings.weixin_login.appid
      response_code = conn.get("/wx/mp_auth/qrcode/#{appid}.json")
      data = JSON.parse(response_code.body)
      uri = URI("#{Settings.weixin_login.host}/wx/mp_auth?appid=#{appid}")
      params = {code: data['code'], origin: wechat_login_micro_website_url}
      uri.query = URI.encode_www_form URI.decode_www_form(uri.query || '').concat(params.to_a)
      redirect_to uri.to_s
    end
end
