<template>
  <div>
    <div class="btn-group">
      <button type="button" class="btn btn-success" @click="showModal = true">选择已有图片</button>
      <button type="button" class="btn btn-success file">批量添加图片
        <input type="file" multiple @change="selectImages($event)">
      </button>
    </div>
      <div class="row">
          <div class="col-sm-6 col-md-3 image" v-for="(image, index) in imageList">
            <image-upload :auto-upload="true" 
                          :name="name" 
                          :server="server" 
                          v-model="image.id"
                          :image-url="image.image_url"
                          :init-save="image.init_save" 
                          @remove="delete_image(image)"
                          :key="image.image_url">
            </image-upload>
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
        if(this.imageListIds.indexOf(image.id) >= 0){
          this.delete_image(image);
        }else{
          this.imageList.push(image);  
        }
      },
      delete_image(image){
        var image_index = this.get_image_index(image.id);
        if(image_index >= 0){
          this.imageList.splice(image_index,1)
        }
      },
      selectImages(event){
        var vm = this;
        var files = event.target.files;
        for(var i=0; i<files.length; i++){
          var obj = {};
          obj.image_url = vm.getObjectURL(files[i]);
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
      get_image_index(id) {
        var vm = this;
        for(var i = 0; i< vm.imageList.length; i++)
          if(vm.imageList[i].id == id){
            return i;
          }
        return -1;
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
  .image{
      height: 300px;
      display: block;
      margin-right: -10px;
      overflow: hidden;
      padding: 10px;
  }

</style>