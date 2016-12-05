$(document).ready ->
  tmp = $ ".tracker .visit_detailed"
  if tmp.length > 0
    load_url = tmp.data('url')
    loadDetailed = (selected_page)->
      $(document).scrollTop(0)
      console.log(selected_page)
      $.ajax
        type: 'get'
        url: load_url
        dataType: 'json'
        data:
          page: selected_page || 1
        success: (data)->
          app._data.visits = data.visits
          app._data.total_pages = data.total_pages
          app._data.selected_page = data.selected_page
          documentLoadAnimation(true)
        error: ->
          documentLoadAnimation(false, '数据加载失败，请刷新页面')
    app = new Vue
      el: tmp[0]
      data:
        visits: []
        total_pages: 1
        selected_page: 1
      methods:
        loadDetailed: (n)->
          loadDetailed(n)
    loadDetailed()
