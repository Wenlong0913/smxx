<template>
  <div>
    <div class="btn-group">
      <button type="button" class="btn btn-success" @click="showModal = true">选择已有图片</button>
      <button type="button" class="btn btn-success file">批量添加图片
        <input type="file" multiple @change="selectImages($event)">
      </button>
    </div>
    <div id="gallery" class="gallery">
      <div class="row">
          <div class="col-sm-6 col-md-3" v-for="(image, index) in imageList">
            <image-upload :auto-upload="true" 
                          :name="name" 
                          :server="server" 
                          :id="image.id"
                          :image-url="image.data.image"
                          :init-save="image.init_save" 
                          @remove="removeImage(index)">
            </image-upload>
          </div>
      </div>
    </div>

    <!-- use the modal component, pass in the prop -->
    <modal v-if="showModal" @close="showModal = false">
      <h3 slot="header">
        选择图片
      </h3>

      <div slot="body">
        <image-album :server="server" :delete-server="server" @selected="selected_images" :selected-list="imageListIds"></image-album>
      </div>
    </modal>
  </div>
</template>

<script>
  export default {
    props: ['server', 'name', 'selectedIds'],
    data(){
      return {
        showModal: false,
        listServer: '',
        deleteServer: '',
        imageList: []
      }
    },
    computed: {
      imageListIds: function () {
        return this.imageList.map(function(image) {
          return image.id;
        })
        // return [1,2,3];
      }
    },
    mounted (){
      var vm = this;
      if(vm.selectedIds){
        vm.$http.get(vm.server + '?ids=' + vm.selectedIds).then((data) => {
          vm.imageList = data.body.image_items;
        }, (response) => {
            // error callback
        });
      }
     
    },
    methods: {
      selected_images(image){
        this.imageList.push(image);
      },
      delete_image(image){
        this.imageList.splice(this.imageList.indexOf(image),1)
      },
      selectImages(event){
        var vm = this;
        var files = event.target.files;
        for(var i=0; i<files.length; i++){
          var obj = {};
          obj.data={}
          obj.data.image = vm.getObjectURL(files[i]);
          obj.init_save = true;
          vm.imageList.push(obj);
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
      },
      removeImage(index){
        // this.imageList.splice(index, 1);
      }
    }
  }
</script>

<style scoped>
  .file {
      position: relative;
      display: inline-block;
      /*background: #00acac;*/
      border-color: transparent;
      /*border-radius: 4px;*/
      /*padding: 4px 12px;*/
      overflow: hidden;
      /*color: #fff;*/
      text-decoration: none;
      text-indent: 0;
      /*line-height: 30px;*/
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