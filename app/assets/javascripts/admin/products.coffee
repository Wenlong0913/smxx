$(document).ready ()->
  pages = $('body.admin-products')
  if pages.length > 0
    # tags
    default_site_tags = pages.find('.product-tags').data('site-tags')
    tags = pages.find('.product-tags').tagit({
      fieldName: "product[tag_list][]",
      availableTags: default_site_tags
    })
    pages.find(".most-tag-list span.label").on 'click', ->
      pages.find('.product-tags').tagit 'createTag', $(this).text()
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
