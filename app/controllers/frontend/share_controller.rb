class Frontend::ShareController < Frontend::BaseController
  # share 可接受：user/order/community/product/site
  # 实例：http://xxx.com/frontend/share/user/1
  def index
    begin
      @share_obj = eval("::#{params[:class].capitalize}.find_by(id: #{params[:id]})")
    rescue
      @share_obj = @cms_site
    end
  end
end
