$(document).ready ()->
  pages = $('body.admin-materials')
  if pages.length > 0
    container = pages.find(".catalog-list")
    if container.length > 0
      catalog = new Vue
        el: container[0]
        data:
          id: container[0].dataset["catalogId"]
          showCatalog: false
          catalogs: container[0].dataset["catalogName"]
          selecteDefault: []
        methods:
          selected: (catalogs)->
            _this = this
            _this.selecteDefault = []
            catalogs.map (i)->
              _this.selecteDefault.push i.id
            _this.catalog =  catalogs[catalogs.length-1]
            _this.id = this.catalog.id
            _this.showCatalog = false
            _this.catalogs = catalogs.map((cata)-> cata.name).join('/')
      image_container = pages.find('image-select')
      image = new Vue
        el: image_container[0]
