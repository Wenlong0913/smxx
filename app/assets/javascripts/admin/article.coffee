$(document).ready ()->
  pages = $('body.admin-articles')
  if pages.length > 0
    image_container = pages.find('image-select')
    if image_container.length > 0
      image = new Vue
        el: image_container[0]
