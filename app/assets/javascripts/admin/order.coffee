$(document).ready ()->
  pages = $('body.admin-orders')
  if pages.length > 0
    container = pages.find(".order-form")
    if container.length > 0
      image_container = container.find('image-select')
      image = new Vue
        el: image_container[0]
