$(document).ready ->    
  processImageItemBlock = ()->
    blockEle  = $(this)
    url       = blockEle.data('url')
    image_item_resource = $(blockEle).find("input[name='image_item_resource']").val()

    blockEle.attr 'uuid', "#{new Date().getTime()}-#{Math.random()}"

    getObjectURL = (file) ->
      url = null
      if window.createObjectURL != undefined
        url = window.createObjectURL file
      else if window.URL != undefined
        url = window.URL.createObjectURL file 
      else if window.webkitURL != undefined
        url = window.webkitURL.createObjectURL file
      url

    parseSlim = (class_name, flag)->
      $('.'+class_name).slim({
        ratio: 'input',
        label: '选择图片',
        buttonConfirmLabel: '确认',
        buttonCancelLabel: '取消',
        saveInitialImage: flag,
        willSave: (data, ready) ->
          image_data = data.output.image
          ele = this.element
          item = $(ele).parents('.image_items')
          image_item_entry = $(item).find("input[name='image_item_entry']")
          image_item_data = $(item).find("input[name='image_item[image_data]']")
          $.ajax({
            url: url, 
            type: 'POST',
            dataType: 'json',
            data: { 'image_item[image_data]': image_data, image_item_resource: image_item_resource, 'image_item[id]': image_item_entry.val() }
          }).done( (data)->
            image_item_entry.val(data.entry_id)
            image_item_data.val('')
          ).fail( ()->
            console.log("An error occurred, the files couldn't be sent!")
          )
          ready(data)
        ,
        willRemove: (slim, remove)->
          ele = this.element
          item = $(ele).parents('.image_items')
          image_item_entry = $(item).find("input[name='image_item_entry']")
          if image_item_entry.val() == ""
            window.alert("该图片正在上传中，暂无法操作！")
          else
            if window.confirm("该图片已上传啦，确定要删除图片吗？")
              $.ajax({
                url: url, 
                type: 'POST',
                dataType: 'json',
                data: { 'image_item[id]': image_item_entry.val(), deleted: true, image_item_resource: image_item_resource}
              }).done( (data)->
                image_item_entry.val('')
                remove()
                item.remove()
              ).fail( ()->
                console.log("An error occurred, the files couldn't be sent!")
              )
        ,
    })

    initSlim = (class_name, flag)->
      window.setTimeout -> 
        parseSlim(class_name, flag)
      , 10      
    
    batchProcessImages = (event)->
      files = event.target.files
      for file in files
        objectUrl = getObjectURL file
        app._data.image_items.push {image_data: objectUrl, is_new: true}
      initSlim('new-slim', true)

    loadImageItmes = ()->
      $.get url, image_item_resource: image_item_resource
      .success (data)->
        app._data.image_items = data
        app._data.loading = false
        initSlim('old-slim', false)      
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
          app._data.show_message = false
        .error (error)->
          app._data.error = true


    app = new Vue
      el: "[rel='image-item-block'][uuid='#{blockEle.attr('uuid')}']"
      data: {
        image_items: [],
        error: false,
        loading: true,
        show_message: false,
        newClass: 'new-slim',
        oldClass: 'old-slim'
      }
      methods: {
        batchProcessImages: batchProcessImages
        uploadDescription: uploadDescription
      }

    loadImageItmes()
  # apply to all image-item-block
  $('[rel="image-item-block"]').each processImageItemBlock



