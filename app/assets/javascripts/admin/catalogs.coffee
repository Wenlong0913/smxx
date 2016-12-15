$(document).ready ->
  body = $('body.admin-catalogs.index')
  if body.length > 0
    url = body.find('.catalogs').data('url')
    $(".slimscroll").slimScroll
      size: '10px'
      color: '#000'
      position: 'bottom'
    # fun-设置宽度
    setScrollWidth = ->
      minWidth = parseInt(body.find('.well').css('min-width'))
      factWidth = app._data.catalogs.length * 310
      if minWidth <= factWidth
        body.find('.well ol').width factWidth
        body.find('.well').scrollLeft(factWidth)

    # load data
    loadCatalog = (id ,index)->
      $.ajax
        url: url
        type: 'get'
        dataType: 'json'
        data:
          id: id
        success: (data)->
          app._data.catalogs[index].parent_id     = data.parent_id
          app._data.catalogs[index].record        = data.record
          if data.record.length > 0
            app._data.catalogs[index].loadingStatus.loading = false
          else
            app._data.catalogs[index].loadingStatus =
              loading: true
              failed: true
              message: '暂无数据..'
        error: ->
          $.gritter.add({title: '提示', text: 'Catalog 数据加载失败.'})

    removeData = (dom)->
      dom.hide()
      $.ajax
        url: url+'/'+dom.data('id')
        type: 'DELETE'
        error: ->
          dom.show()
          $.gritter.add({title: '提示', text: 'Catalog 删除失败.'})

    # 获取all 列表
    getCatalogList = ->
      url = url
      $.ajax
        url: url
        type: 'get'
        dataType: 'json'
        data:
          status: 'all'
        success: (data)->
          data.record = $.map data.record, (obj)->
            { id: obj.id, text: obj.name }
          app._data.modalFormStatus.updateStatus = true
          app._data.catalogsAll = data.record
        error: ->
          app._data.modalFormStatus.updateStatus = false
          $.gritter.add({title: '提示', text: 'Catalog 数据获取失败.'})

    # bind 分类数据
    window.app = new Vue
      el: '.catalogs'
      data:
        catalogsAll: [] #　select列表
        breadcrumb: [] # 路径导航
        modalFormStatus: # modal edit/new
          title: ''
          url: ''
          message: ''
          updateStatus: false
          value:
            parent_id: ''
            name: ''
        catalogs:[
          {
            record: []
            parent_id: ''
            searchText: ''
            loadingStatus:
              loading: true
              failed: false
              message: '数据加载中..'
          }
        ]
      methods:
        filterCatalog: (v)->
          v.record.filter (i)->
            i.name.indexOf(v.searchText) != -1
        mouseEnters: (event)->
          $(event.target).find('.col-xs-3').removeClass('hidden').addClass('show')
        mouseLeaves: (event)->
          $(event.target).find('.col-xs-3').removeClass('show').addClass('hidden')
        clickReplace: (event)->
          thisDom = $(event.target).parent()
          thisDom.parents('ul.list-unstyled').find('li').removeClass('active')
          thisDom.addClass('active')
          index = thisDom.parents('.black-classify').index()
          this.breadcrumb[index] = $(event.target).text()
          this.breadcrumb.splice(index+1, this.breadcrumb.length-1)
          if this.catalogs.length == index+1
            this.catalogs.push({record: [], parent_id: '', searchText: '', alertTitle:[true, false, '数据加载中..']})
          else if this.catalogs.length > index+1
            this.catalogs.splice(index+2, this.catalogs.length-1)
            this.catalogs[index+1].record = []
            this.catalogs[index+1].parent_id = ''
            this.catalogs[index+1].searchText = ''
          this.catalogs[index+1].loadingStatus =
            loading: true
            failed: false
            message: '数据加载中..'
          loadCatalog(thisDom.data('id'), index+1)
          setScrollWidth()
        removeData: (event, catalogsIndex, thisId)->
          if this.catalogs.length > catalogsIndex+1 && parseInt(this.catalogs[catalogsIndex+1].parent_id) == parseInt(thisId)
            this.catalogs.splice(catalogsIndex+1, this.catalogs.length-1)
          setScrollWidth()
          removeData($(event.target).parents('li.column'))
        openModal: (caseStatus, editId, parentId, name)->
          getCatalogList()
          if caseStatus == 'new'
            this.modalFormStatus.title = "创建目录"
            this.modalFormStatus.type = 'post'
            this.modalFormStatus.url = url
            this.modalFormStatus.value.name = ''
          else if caseStatus == 'edit'
            this.modalFormStatus.type = 'patch'
            this.modalFormStatus.title = "修改目录"
            this.modalFormStatus.url = url+"/"+editId
            this.modalFormStatus.value.name = name
          this.modalFormStatus.message = ''
          this.modalFormStatus.value.parent_id = parentId
          console.log this.modalFormStatus.title
          console.log this.modalFormStatus.url
        toUpdate: ->
          app._data.modalFormStatus.updateStatus = true
          app._data.modalFormStatus.message = '信息保存中'
          selectedId = this.modalFormStatus.value.parent_id
          $.ajax
            url: this.modalFormStatus.url
            type: this.modalFormStatus.type
            dataType: 'json'
            data: this.modalFormStatus.value
            success: (data)->
              if selectedId == undefined || selectedId == ''
                loadCatalog(null, 0)
              else
                for catalog,index in app._data.catalogs
                  if parseInt(selectedId) == parseInt(catalog.parent_id)
                    loadCatalog(catalog.parent_id, index)
              app._data.modalFormStatus.message = '信息保存成功'
            error: ->
              $.gritter.add({title: '提示', text: 'Catalog 操作失败.'})
              app._data.modalFormStatus.updateStatus = false

    # 初始数据
    loadCatalog(null, 0)
