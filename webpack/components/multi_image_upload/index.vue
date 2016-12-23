<template>
  <div>
    <a href="javascript:;" class="file">批量添加图片
      <input type="file" multiple @change="selectImages($event)">
    </a>
    <p class="text-info">添加后的图片需要编辑后才会自动上传</p>
    <div class="row">
        <image-upload v-for="image in images" 
                      :auto-upload="autoUpload" 
                      :name="name" 
                      :server="server" 
                      :image-url="image.url" 
                      class="col-md-4">
        </image-upload>
    </div>

  </div>

</template>

<script>
  
  export default{
    props: ['name', 'autoUpload', 'server'],
    data() {
      return {
        images: []
      }
    },
    methods: {
      selectImages(event){
        var vm = this;
        var files = event.target.files;
        for(var i=0; i<files.length; i++){
          var obj = {};
          obj.url = vm.getObjectURL(files[i]);
          vm.images.push(obj);
        }
      },
      getObjectURL(file){
        var url = null ; 
        if (window.createObjectURL!=undefined) { // basic
          url = window.createObjectURL(file) ;
        } else if (window.URL!=undefined) { // mozilla(firefox)
          url = window.URL.createObjectURL(file) ;
        } else if (window.webkitURL!=undefined) { // webkit or chrome
          url = window.webkitURL.createObjectURL(file) ;
        }
        return url ;
      }
    }
  }

</script>

<style scoped>
  .file {
      position: relative;
      display: inline-block;
      background: #00acac;
      border-color: transparent;
      border-radius: 4px;
      padding: 4px 12px;
      overflow: hidden;
      color: #fff;
      text-decoration: none;
      text-indent: 0;
      line-height: 30px;
  }
  .file input {
      position: absolute;
      font-size: 100px;
      right: 0;
      top: 0;
      opacity: 0;
  }
  .file:hover {
      background: skin-color(primary-l);
      border-color: transparent;
      color: #fff;
      text-decoration: none;
  }
</style>