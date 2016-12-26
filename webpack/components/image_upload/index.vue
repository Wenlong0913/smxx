<template>
  <div>
    <input type="file" :name="name"/>
    <input type="hidden" :name="name" :value="id">
    <img :src="imageUrl" v-if="!initSave">
  </div>
</template>

<script>
  import Slim from './slim.commonjs'
  export default {
    props: ['name', 'autoUpload', 'server', 'imageUrl', 'initSave', 'id'],
    data () {
      return {
         cropper: null
      }
    },
    mounted (){
      var vm = this;
      this.cropper = new Slim(vm.$el, {
        service:  vm.server || '/image_items',
        push: vm.autoUpload,
        label: '选择图片',
        buttonConfirmLabel: '确定',
        buttonCancelLabel: '取消',
        didRemove: function(data){
          vm.$emit('remove');
        }
      }); 
      if(vm.imageUrl && vm.initSave) this.cropper.load(vm.imageUrl)
    }    
  }
</script>

<style src="./slim.min.css">
</style>
