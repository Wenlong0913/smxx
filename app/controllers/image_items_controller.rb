class ImageItemsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:create]

  def create
    flag, @image_item = ImageItem::Create.(image_item_params)
    if flag
      render json: @image_item.id
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
        hash_params["name"] = json_image_data["input"]["name"]
        hash_params["image_data"] = json_image_data['output']['image']
        hash_params["site"] = Site.first #item要求必须有site
        return hash_params
      end
    end
    {}
  end
end
