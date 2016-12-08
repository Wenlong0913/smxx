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

    initSlim = ()->
      window.setTimeout -> 
        $('body').slimParse()
      , 10      
    
    batchProcessImages = (event)->
      files = event.target.files
      for file in files
        objectUrl = getObjectURL file
        app._data.image_items.push {image_data: objectUrl, is_new: true}
      initSlim()

    loadImageItmes = ()->
      $.get url, image_item_resource: image_item_resource
      .success (data)->
        app._data.image_items = data
        app._data.loading = false
        initSlim()      
      .error (error)->
        app._data.error = true

    uploadDescription = (event)->
      app._data.show_message = true
      textarea = event.target
      image_item_id = $(textarea).parents('.image_items').find('input[name="image_item_entry"]').val()
      if image_item_id != ''
        $.post url, 'image_item[id]': image_item_id, 'image_item[description]': textarea.value
        .success (data)->
          app._data.error = false
        .error (error)->
          app._data.error = true

    app = new Vue
      el: "[rel='image-item-block'][uuid='#{blockEle.attr('uuid')}']"
      data: {
        image_items: [],
        error: false,
        loading: true,
        show_message: false
      }
      methods: {
        batchProcessImages: batchProcessImages
        uploadDescription: uploadDescription
      }

    loadImageItmes()
  # apply to all image-item-block
  $('[rel="image-item-block"]').each processImageItemBlock



