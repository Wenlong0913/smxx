$(document).ready ->    
  processImageItemBlock = ()->
    blockEle  = $(this)
    url       = blockEle.data('url')
    image_item_resource = $(blockEle).find("input[name='image_item_resource']").val()

    blockEle.attr 'uuid', "#{new Date().getTime()}-#{Math.random()}"

    getObjectURL = (file) ->
      url = null ; 
      if window.createObjectURL != undefined
        url = window.createObjectURL file
      else if window.URL != undefined
        url = window.URL.createObjectURL file 
      else if window.webkitURL != undefined
        url = window.webkitURL.createObjectURL file
      url
    
    batchProcessImages = (event)->
      files = event.target.files
      for file in files
        objectUrl = getObjectURL file
        app._data.image_items.push {image_data: objectUrl, is_new: true}
      window.setTimeout -> 
        $('body').slimParse()
      , 10

    loadImageItmes = ()->
      $.get url, image_item_resource: image_item_resource
      .success (data)->
        app._data.image_items = data
        window.setTimeout -> 
          $('body').slimParse()
        , 10        
      .error (error)->
        app._data.error = true

    app = new Vue
      el: "[rel='image-item-block'][uuid='#{blockEle.attr('uuid')}']"
      data: {
        image_items: []
      }
      methods: {
        batchProcessImages: batchProcessImages
      }

    loadImageItmes()
  # apply to all image-item-block
  $('[rel="image-item-block"]').each processImageItemBlock



