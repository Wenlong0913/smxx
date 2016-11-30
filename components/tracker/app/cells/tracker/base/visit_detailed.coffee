$(document).ready ->
  tmp = $ ".tracker .visit_detailed"
  if tmp.length > 0
    load_url = tmp.data('url')
    loadDetailed = ->
      $.ajax
        type: 'get'
        url: load_url
        dataType: 'json'
        success: (data)->
          app._data.visits = data
          documentLoadAnimation(true)
        error: ->
          documentLoadAnimation(false, '数据加载失败，请刷新页面')
    app = new Vue
      el: tmp[0]
      data:
        visits: []
    loadDetailed()
