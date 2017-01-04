$(document).ready ()->
  pages = $('body.admin-material_outputs')
  if pages.length > 0
    container = pages.find('.choose-material')
    if container.length > 0
      initMaterialOutputDetails = JSON.parse(container[0].dataset["initMaterialOutputDetails"])
      console.log(initMaterialOutputDetails)
      catalog = new Vue
        el: container[0]
        data:
          showModel: false
          materials: []
          materialOutputDetails: []
          selectedAll: false
        computed:
          selectedDetails: ()->
            this.materials.filter((m)->
              return m.selected
            )
        mounted: ()->
          vm = this
          # load data
          vm.$http.get("/admin/materials.json").then((data)->
            data.body.forEach((value)->
              value.number = 1
              detail = vm.getDetail(value.id)
              if detail.number
                value.selected = true
                value.number = detail.number
              else
                value.selected = false
              vm.materials.push(value)
              vm.materialOutputDetails = vm.selectedDetails
            )
          ,(response)->
          )
        methods:
          cancel: ()->
            this.showModel = false
          confirm: ()->
            this.materialOutputDetails = this.selectedDetails
            this.showModel = false
          deleteDetail: (id, index)->
            this.materials.forEach((material)->
              if material.id == id
                material.selected = false
            )
            this.materialOutputDetails.splice(index, 1)
          getDetail: (id)->
            detail = {}
            initMaterialOutputDetails.forEach((mod)->
              if mod.material_id == id
                detail = mod
            )
            detail
          selectAll: ()->
            



