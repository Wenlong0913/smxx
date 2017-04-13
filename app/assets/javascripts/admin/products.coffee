$(document).ready ()->
  pages = $('body.admin-products')
  if pages.length > 0
    # tags
    default_site_tags = pages.find('.product-tags').data('tags-all')
    pages.find('.product-tags').tagit({
      fieldName: "product[tag_list][]",
      availableTags: default_site_tags
    })
    pages.find(".most-tag-list span.label").on 'click', ->
      pages.find('.product-tags').tagit 'createTag', $(this).text()
    # 商品单位切换显示
    pages.find('.weight-input-group .input-group-btn ul.dropdown-menu li a').on 'click', ->
      selectedVal = $(this).data('val')
      selectedText = $(this).text()
      $(this).parents('.weight-input-group').find('.input-group-btn .dropdown-toggle small').text(selectedText)
      $(this).parents('.weight-input-group').find('input.hidden-input').val(selectedVal)
    # 附加属性添加
    attrListDom = pages.find("div[rel='attr_list_vue']")
    attrList = new Vue
      el: attrListDom[0]
      data:
        defaultvalues: {}
        defaultkeys: {}
        lists: []
        count: 1
      methods:
        addInputList: ->
          this.count++
          this.lists.push({key: '', value: '', name: this.count})
        removeInputList: (index)->
          this.lists.splice(index, 1)
    defaultkeys = pages.find("div[rel='attr_list_vue']").data('keys')
    defaultvalues = pages.find("div[rel='attr_list_vue']").data('values')
    attrList.lists = []
    max = 0
    for name, v of defaultkeys
      if parseInt(name) > 0
        max = parseInt(name) if max < parseInt(name)
        attrList.lists.push {key: v, name: parseInt(name), value: defaultvalues[name]}
        attrList.count = max+1
    attrList.lists.push {key: ' ', name: attrList.count, value: ' '}
    # vue catalog / image-select
    container = pages.find('.catalog-list')
    if container.length > 0
      catalog = new Vue
        el: container[0]
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

      image_container = pages.find('image-select')
      image = new Vue
        el: image_container[0]
