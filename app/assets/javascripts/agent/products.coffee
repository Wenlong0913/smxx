$(document).ready ->
  # index
  bodyIndex = $('body.agent-products.index')
  if bodyIndex.length > 0
    $(".other-attr input[type='checkbox']").each ->
      if $(this).data('val') == 1
        $(this).prop('checked', true)
    catalogDom = bodyIndex.find(".catalog-list[rel='catalog-list']")
    catalog = new Vue
      el: "div[rel='catalog-list']"
      data:
        id: catalogDom[0].dataset["catalogId"]
        showCatalog: false
        catalogs: catalogDom[0].dataset["catalogName"]
      methods:
        selected: (catalogs)->
          this.catalog =  catalogs[catalogs.length-1]
          this.id = this.catalog.id
          this.showCatalog = false
          this.catalogs = catalogs.map((cata)-> cata.name).join('/')
  # show
  bodyShow = $('body.agent-products.show')
  if bodyShow.length > 0
    # 更改上架标志
    onCheckShelvesStatus = ()->
      bodyShow.find('.process_shelves button').on 'click', ->
        parentsDom = $(this).parents('.process_shelves')
        url = parentsDom.data('url')
        status = $(this).data('status')
        $.ajax
          url: url
          data:
            status: status
          type: 'post'
          success: (data)->
            if data.status == 'ok' && parseInt(status) == 0
              parentsDom.find('button').text('产品上架').removeClass('btn-inverse').addClass('btn-warning').data('status', 1)
            else
              parentsDom.find('button').text('取消上架').removeClass('btn-warning').addClass('btn-inverse').data('status', 0)
            # onCheckShelvesStatus()
          error: (data)->
            alert('错误')
    onCheckShelvesStatus()
    #
    bodyShow.find('ul.checkout_image_list li a').on "click", ->
      imageUrl = $(this).data('url')
      bodyShow.find(".product-main-image[data-id='main-image'] img").attr('src', imageUrl)
      bodyShow.find('ul.checkout_image_list li').removeClass('active')
      $(this).parent().addClass('active')
    setTimeout ->
      bodyShow.find('#editModal .modal-content form').on "ajax:success", (event, request)->
        if request.hasOwnProperty('error')
          $(this).find('.modal-body .alert.alert-danger').removeClass('hide').find('span.title').text(request.error)
          $('#editModal').scrollTop(0)
    # 请求地址
    shareUrl = bodyShow.find(".share[rel='share']").data('url')
    share = new Vue
      el: ".share[rel='share']"
      data:
        showSharModal: false
        url: ''
      methods:
        getSalesDistribution: (product_id)->
          this.showSharModal = true
          self = this
          return if self.url.length > 1
          $.ajax
            url: shareUrl
            type: 'post'
            success: (data)->
              if data.code.length > 1
                self.url = data.share_path
              else
                alert('数据获取失败')
            error: (data)->
              alert('错误')
  # new
  bodyNew = $('body.agent-products.new')
  if bodyNew.length > 0
    # 检测名称是否填写
    bodyNew.find('input#product_name').val('')
    $("#basicInformation a[href='#configurationInformation']").on　'show.bs.tab', ->
      productNameDom = $(this).parents('#basicInformation').find('input#product_name')
      if productNameDom.val() == "" || productNameDom == null
        $.gritter.add({title: '提示', text: "商品基本信息：产品名称必须填写！"})
        productNameDom.css('border','1px solid red')
        productNameDom.on 'focus', ->
          productNameDom.css('border','1px solid #ccd0d4')
        return false

    bodyNew.find('.weight-input-group .input-group-btn ul.dropdown-menu li a').off().on 'click', ->
      selectedVal = $(this).data('val')
      selectedText = $(this).text()
      $(this).parents('.weight-input-group').find('.input-group-btn .dropdown-toggle small').text(selectedText)
      $(this).parents('.weight-input-group').find('input.hidden-input').val(selectedVal)
    container = bodyNew.find('.catalog-list')
    catalog = new Vue
      el: "div[rel='catalog-list']"
      data:
        id: container[0].dataset["catalogId"]
        showCatalog: false
        catalogs: container[0].dataset["catalogName"]
      methods:
        selected: (catalogs)->
          this.catalog =  catalogs[catalogs.length-1]
          this.id = this.catalog.id
          this.showCatalog = false
          this.catalogs = catalogs.map((cata)-> cata.name).join('/')
    additional = new Vue
      el: "div[rel='additional-attributes"
      data:
        lists: [
          {key: '尺寸', value: '', name: '1'}
          {key: '颜色', value: '', name: '2'}
        ]
        count: 3
      methods:
        addInputList: ->
          this.lists.push({key: '', value: '', name: this.count})
          this.count++
        removeInputList: (index)->
          this.lists.splice(index, 1)
    bodyNew.find('.change-step').on 'click', ->
      change_step_class = $(this).attr("href").replace("#", "")
      bodyNew.find('.checkout-header .step').removeClass('active')
      bodyNew.find("."+change_step_class).addClass('active')
    bodyNew.find('form#new_product').on 'ajax:error', (event,request)->
      return_mess(setinterval_1, '发送失败！请检查网络')
    bodyNew.find('form#new_product').on 'ajax:success', (event,request)->
      bodyNew.find('#last .new-product').attr("href", request.url)
      bodyNew.find('.checkout-header .step').removeClass('active')
      bodyNew.find("[role='tabpanel']").removeClass('active in')
      bodyNew.find('.last.step').addClass('active')
      $('#last').addClass('active in')
      count = 5
      oldLocation= window.location
      set = setInterval ->
        bodyNew.find('.jumbotron .jump-time').text(count)
        count = count - 1
        if count < 0
          clearInterval(set)
          if $('#last').text().length > 0
            window.location.href = request.url
      , 1000

  # edit
  bodyEdit
  bodyEdit = $('body.agent-products.edit')
  if bodyEdit.length > 0
    # 商品单位切换显示
    setTimeout ->
      bodyEdit.find('.weight-input-group .input-group-btn ul.dropdown-menu li a').on 'click', ->
        selectedVal = $(this).data('val')
        selectedText = $(this).text()
        $(this).parents('.weight-input-group').find('.input-group-btn .dropdown-toggle small').text(selectedText)
        $(this).parents('.weight-input-group').find('input.hidden-input').val(selectedVal)
    , 500
    # 分类 图片 - Vue
    container = bodyEdit.find('.catalog-list')
    editProducts = new Vue
      el: "div[rel='vue-dom']"
      data:
        defaultvalues: {}
        defaultkeys: {}
        id: container[0].dataset["catalogId"]
        showCatalog: false
        catalogs: container[0].dataset["catalogName"]
        lists: []
        count: 1
      methods:
        selected: (catalogs)->
          this.catalog =  catalogs[catalogs.length-1]
          this.id = this.catalog.id
          this.showCatalog = false
          this.catalogs = catalogs.map((cata)-> cata.name).join('/')
        addInputList: ->
          this.count++
          this.lists.push({key: '', value: '', name: this.count})
        removeInputList: (index)->
          this.lists.splice(index, 1)
    editProductsData = editProducts._data
    defaultkeys = bodyEdit.find(".product-body[rel='vue-dom']").data('keys')
    defaultvalues = bodyEdit.find(".product-body[rel='vue-dom']").data('values')
    editProductsData.lists = []
    max = 0
    for name, v of defaultkeys
      if parseInt(name) > 0
        max = parseInt(name) if max < parseInt(name)
        editProductsData.lists.push {key: v, name: parseInt(name), value: defaultvalues[name]}
        editProductsData.count = max+1
    editProductsData.lists.push {key: ' ', name: editProductsData.count, value: ' '}
