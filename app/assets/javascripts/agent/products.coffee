$(document).ready ->
  body = $('body.agent-products.show')
  if body.length > 0
    body.find('ul.checkout_image_list li a').on "click", ->
      imageUrl = $(this).data('url')
      body.find(".product-main-image[data-id='main-image'] img").attr('src', imageUrl)
      body.find('ul.checkout_image_list li').removeClass('active')
      $(this).parent().addClass('active')
    setTimeout ->
      body.find('#editModal .modal-content form').on "ajax:success", (event, request)->
        if request.hasOwnProperty('error')
          $(this).find('.modal-body .alert.alert-danger').removeClass('hide').find('span.title').text(request.error)
          $('#editModal').scrollTop(0)
    container = body.find('.catalog-list')
    new Vue
      el: "div[rel='edit-modal']"
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
  body = $('body.agent-products.new')
  if body.length > 0
    container = body.find('.catalog-list')
    catalog = new Vue
      el: "div[rel='basicInformation']"
      data:
        id: container[0].dataset["catalogId"]
        showCatalog: false
        as: '654554'
        catalogs: container[0].dataset["catalogName"]
      methods:
        selected: (catalogs)->
          this.catalog =  catalogs[catalogs.length-1]
          this.id = this.catalog.id
          this.showCatalog = false
          this.catalogs = catalogs.map((cata)-> cata.name).join('/')
    additional = new Vue
      el: "#additional-attributes"
      data: 
        lists: [
          ['尺寸', 'attr_1']
          ['颜色', 'attr_2']
        ]
        count: 3
      methods:
        addInputList: ->
          this.lists.push(['', "attr_"+this.count])
          this.count++
        removeInputList: (index)->
          this.lists.splice(index, 1)
    body.find('.change-step').on 'click', ->
      change_step_class = $(this).attr("href").replace("#", "")
      body.find('.checkout-header .step').removeClass('active')
      body.find("."+change_step_class).addClass('active')
    body.find('form').on 'ajax:error', (event,request)->
      return_mess(setinterval_1, '发送失败！请检查网络')
    body.find('form').on 'ajax:success', (event,request)->
      body.find('#last .new-product').attr("href", request.url)
      body.find('.checkout-header .step').removeClass('active')
      body.find("[role='tabpanel']").removeClass('active in')
      body.find('.last.step').addClass('active')
      $('#last').addClass('active in')
      count = 5
      set = setInterval ->
        body.find('.jumbotron .jump-time').text(count)
        count = count - 1
        if count < 0
          clearInterval(set)
          window.location.href = request.url
      , 1000
