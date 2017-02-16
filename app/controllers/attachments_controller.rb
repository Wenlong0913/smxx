class AttachmentsController < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:create]

  def create
    # data = image_item_params
    # if params[:site_id]
    #   @site = Site.find(@site)
    #   authorize @site, :edit
    # else
    #   authorize ImageItem
    # end
    # flag, @image_item =
    #   if data[:id]
    #     ImageItem::Update.(data[:id], data, user: current_user)
    #   else
    #     ImageItem::Create.(data, user: current_user)
    #   end
    # if flag
    #   render json: @image_item.id
    # else
    #   render json: @image_item.errors, status: :failed
    # end
  end

  def destroy
    # @image_item = ImageItem.find(params[:id])
    # flag, @image_item = ImageItem::Destroy.(@image_item, user: current_user)
    # if flag
    #   render json: {}
    # else
    #   head 403
    # end
  end

  private
  def image_item_params
    json_image_data = {}
    params.each_pair do |k, v|
      if v[:image_item_ids]
        hash_params = {}
        json_image_data = JSON.parse(v[:image_item_ids].first)
        hash_params[:name] = json_image_data["input"]["name"]
        # hash_params[:data] = json_image_data["input"]["name"]
        hash_params[:image] = json_image_data['output']["image"]
        hash_params[:id] = json_image_data['server']
        # hash_params[:user_id] = current_user.id
        # hash_params[:site_id] = params[:site_id]
        hash_params[:owner] = current_user
        return hash_params
      end
    end
    {}
  end
end
