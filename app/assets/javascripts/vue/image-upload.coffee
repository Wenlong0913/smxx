#= require vue/dist/vue
#= require slim-image-cropper/slim.jquery
Vue.component 'image-upload',
  props: ['name', 'autoUpload', 'server']
  template: '<input type="file" :name="name"/>'
  mounted: ()->
    vm = this
    $(vm.$el).slim
      service:  vm.server || '/image_items'
      push: vm.autoUpload
      label: '选择图片'
      buttonConfirmLabel: '确定'
      buttonCancelLabel: '删除'
