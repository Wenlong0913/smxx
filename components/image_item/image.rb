- model
  
  name
  url
  width
  height
  image_length

- view
  
  form
    input hidden name='image_session_id' value='aaa'
    cell render compent => on change
    submit => clean image inputs

- controller

  def receive_image_data
    get image_session_id, store in image table

  def create
    product = Product.new(params)
    
    product.save

  # after_action :move_image_data_to_resource, recource: -> { @project }

  # def move_image_data_to_resource
  #   get image_session_id,
  #   ImageTable.where(resource: image_session).update_all(product)    
  
  def get_image_data
    get image_session_id
    ImageTable.where(resource: image_session).all

  def move_image_data_to_resource(resource, limit: 1)

    images = get_image_data
    if images.size == 0
      resource.errors.add(:image_items, '至少一个图片')
    else
      image.resource = resource
    product.images = image

    product.images << image

- compent
  
  edit input.slim => find the nearest parent form, add hidden input(image_item_session_id)

