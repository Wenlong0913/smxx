<template>
  <input type="file" :name="name"/>
</template>

<script>
  import Slim from './slim.commonjs'
  export default {
    props: ['name', 'autoUpload', 'server'],
    mounted (){
      var vm = this;
      new Slim(vm.$el, {
        service:  vm.server || '/image_items',
        push: vm.autoUpload,
        label: '选择图片',
        buttonConfirmLabel: '确定',
        buttonCancelLabel: '删除'
      });
    }    
  }
</script>

<style src="./slim.min.css">
</style>
