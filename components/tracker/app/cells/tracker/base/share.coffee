$(document).ready ->
  tmp = $(".tracker .share_statistic")
  if tmp.length > 0
    url = tmp.data('url')
    if tmp.hasClass('share_two')
      reUrl = url.substring(0, url.indexOf('shares')+6)
    else
      reUrl = url.substring(0, url.indexOf('two_shares')+10)
    tmp.find('#reUrl').attr('href', reUrl)

    loadData = (selected_page)->
      $.ajax
        type: 'get'
        dataType: 'json'
        url: url
        data:
          page: selected_page || 1
        success: (data)->
          if tmp.hasClass('share_two') || tmp.hasClass('share_three')
            share._data.share_obj = data.share_records
          else
            share._data.share_list = data.share_records
          share._data.share = data.share_records[0]
          share._data.total_pages = data.total_pages
          share._data.selected_page = data.selected_page
          share._data.showPage = parseInt(data.selected_page)
          documentLoadAnimation(true)
        error: ->
          documentLoadAnimation(false, '数据加载失败，请刷新页面')

    share = new Vue
      el: tmp[0]
      data:
        share_list: []
        share_obj: {
          root: {}
          records: []
        }
        total_pages: 1
        selected_page: 1
        showPage: 0
      methods:
        redirectTo: (id)->
          if tmp.hasClass('share_two')
            redirectUrl = url + '/' + id + '/three_shares'
          else
            redirectUrl = url + '/' + id + '/two_shares'
          window.location.href = redirectUrl
        loadData: (n)->
          loadData(n)
        onPreviousPageGroup: ()->
          if (this.showPage-5) > 0
            this.showPage = this.showPage-5
          else
            this.showPage = 0
        onNextPageGroup: ()->
          if this.total_pages > 5
            if (this.showPage + 10) <= this.total_pages
              this.showPage = this.showPage + 5
            else
              this.showPage = this.total_pages - 5
        formatDate: (str) ->
          timeDate = new Date(str)
          year = timeDate.getFullYear()
          month = timeDate.getMonth() + 1
          date = timeDate.getDate()
          hour = timeDate.getHours()
          minute = timeDate.getMinutes()
          second = timeDate.getSeconds()
          return year + '年' + month + '月' + date + '日 ' + hour + '时' + minute + '分' + second + '秒'
        # shareCode: (code) ->
        #   return url.substring(0, url.indexOf('tracker')) + "code-" + code
    loadData()
