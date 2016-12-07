$(document).ready ->
  body = $('body.admin-catalogs.index')
  if body.length > 0
    # fun-设置宽度
    setScrollWidth = ->
      well_li_width = body.find('.well ol li.black-classify').length * 310
      if parseInt(body.find('.well').css('min-width')) < well_li_width
        body.find('.well ol').width well_li_width
        alert well_li_width
    # load data
    # loadCatalog = (id)->
    #   url = $('').data('url')
    #   $.ajax ->
    #     url: url
    #     type: 'get'
    #     dataType: 'json'
    #     data:
    #       id: id
    #     success: (data)->
    #       app._data.
    #     error:
    #       console.log('数据加载失败')
    setScrollWidth()

    # # shoe/hidden　功能区域
    # body.find('.well .black-classify .list-body ul li').on 'hover', ->
    #   handleDom = $(this).find('.handle')
    #   if handleDom.hasClass 'hidden'
    #     handleDom.removeClass('hidden').addClass('show')
    #   else
    #     handleDom.removeClass('show').addClass('hidden')

    # bind 分类数据
    app = new Vue
      el: '.catalogs'
      data:
        catalogs:[
          {record: [{id: 1, name: 'q1'},{id: 2, name: 'q2'},{id: 3, name: 'q3'}], parent_id: ''},
          {record: [{id: 1, name: 'q1'},{id: 2, name: 'q2'},{id: 3, name: 'q3'}], parent_id: '2'},
          {record: [{id: 1, name: 'q1'},{id: 2, name: 'q2'},{id: 3, name: 'q3'}], parent_id: '3'}
        ]
      methods:
        mouseEnters: (event)->
          console.log 'en'
          $(event.target).find('.col-xs-3').removeClass('hidden').addClass('show')
        mouseLeaves: (event)->
          console.log 'le'
          $(event.target).find('.col-xs-3').removeClass('show').addClass('hidden')

          # body.find('.well .black-classify .list-body ul li').on 'hover', ->
          #   handle_dom = $(this).find('.handle')
          #   if handle_dom.hasClass 'hidden'
          #     handle_dom.removeClass('hidden').addClass('show')
          #   else
          #     handle_dom.removeClass('show').addClass('hidden')
    #   # method:
