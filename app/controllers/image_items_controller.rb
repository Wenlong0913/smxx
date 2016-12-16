class ImageItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  # 获取Site或User的相册列表
  def index
    assoc =
      if params[:site_id]
        @site = Site.find(@site)
        authorize @site, :edit # can edit site, then can get all images of site
        @site.image_items
      else # user's images
        # current_user.image_items
        ImageItem.all
      end
    if params[:tag_id]
      @image_items = assoc.where(id: params[:tag_id]) 
    else
      @image_items = assoc
    end
    # @image_items = assoc.page(params[:page]).order(updated_at: :desc)
    render json: @image_items
  end

  def create
    data = image_item_params
    if params[:site_id]
      @site = Site.find(@site)
      authorize @site, :edit
    else
      authorize ImageItem
    end
    flag, @image_item =
      if data[:id]
        ImageItem::Update.(data[:id], data, user: current_user)
      else
        ImageItem::Create.(data, user: current_user)
      end
    if flag
      render json: @image_item.id
    else
      head 403
    end
  end

  def destroy
    @image_item = ImageItem.find(params[:id])
    flag, @image_item = ImageItem::Destroy.(@image_item, user: current_user)
    if flag
      render json: {}
    else
      head 403
    end
  end

  private
  def image_item_params
    json_image_data = {}
    params.each_pair do |k, v|
      if v[:image_items]
        hash_params = {}
        json_image_data = JSON.parse(v[:image_items].first)
        hash_params[:name] = json_image_data["input"]["name"]
        hash_params[:data] = json_image_data['output']
        hash_params[:id] = json_image_data['server']
        # hash_params[:user_id] = current_user.id
        # hash_params[:site_id] = params[:site_id]
        hash_params[:owner] = Site.first
        return hash_params
      end
    end
    {}
  end
end
