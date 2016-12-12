$(document).ready -> 
  Vue.component('image-upload', {
    props: ['name', 'autoUpload', 'server'],
    template: '<input type="file" :name="name"/>',
    mounted: ()->
      vm = this;
      console.log(vm)
      $(vm.$el).slim({ 
        service:  vm.server || '/image_items',
        push: vm.autoUpload,
        label: '选择图片',
        buttonConfirmLabel: '确定'
        buttonCancelLabel: '删除'
      });
  })
  