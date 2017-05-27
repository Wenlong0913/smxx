class Frontend::ShareController < Frontend::BaseController
  def index

    if params[:class].present? && params[:id].present?

      if params[:class] == 'User'
          @share_message = User.where(id: params[:id]).first
      end

      if params[:class] == 'Community'
        @share_message = Community.where(id: params[:id]).first
      end

      if params[:class] == 'Product'
        @share_message = Product.where(id: params[:id]).first
      end

    else
      @share_message = @cms_site
    end
  end
end
