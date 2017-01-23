class  Api::V1::ImageItemsController < Api::V1::BaseController
  before_action :authenticate!

  def create
    authorize ImageItem
    flag, image_item = ImageItem::Create.({image: params["file"], owner: @current_user})
    if flag
      render json: {status: 'ok', image_item: image_item_json(image_item)}
    else
      render json: {status: 'failed', error_message:  image_item.errors.messages.inject(''){ |k, v| k += v.join(':') + '. '} }
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
  def image_item_json(image_item)
    image_item.as_json(only: %w(id name), methods: [:image_url, :image_file_name])
  end

end
