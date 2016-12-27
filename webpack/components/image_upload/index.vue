<template>
  <div>
    <input type="file" :name="name"/>
    <input type="hidden" :name="name" :value="value">
    <img :src="imageUrl" v-if="value">
  </div>
</template>

<script>
  import Slim from './slim.commonjs'
  export default {
    // props: ['name', 'autoUpload', 'server', 'imageUrl', 'value'],
    props: {
      name: {type: String, required: true},
      autoUpload: {type: Boolean, default: true},
      server: {type: String, required: true},
      value: {type: Number},
      imageUrl: {type: String}
    },
    data () {
      return {
         cropper: null,
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
        },
        didUpload: function(error, data, response){
          vm.$emit('input', response);
        }
      }); 
      if(vm.imageUrl && !vm.value) this.cropper.load(vm.imageUrl)
    }    
  }
</script>

<style src="./slim.min.css">
</style>
