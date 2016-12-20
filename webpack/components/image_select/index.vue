<template>
  <div>
    <button type="button" class="btn btn-success" @click="showModal = true">选择已有图片</button>

    <div id="gallery" class="gallery">
      <div class="row">
          <div class="image col-sm-6 col-md-4" v-for="image in imageList">
              <div class="image-inner">
                  <a href="javascript:;">
                      <img :src="image.data.image" alt="" />
                  </a>
                  <p class="image-caption">
                      {{image.name}}
                  </p>
              </div>
              <div class="image-info">
                  <input type="hidden" :name="name" :value="image.id">
                  <p>
                    <button type="button" class="btn btn-danger btn-xs" v-on:click="delete_image(image)">删除</button>
                  </p>
              </div>
          </div>
      </div>
    </div>

    <!-- use the modal component, pass in the prop -->
    <modal v-if="showModal" @close="showModal = false">
      <h3 slot="header">选择图片</h3>
      <div slot="body">
        <image-album :server="server" :delete-server="server" @selected="selected_images" :selected-list="imageListIds"></image-album>
      </div>
    </modal>
  </div>
</template>

<script>
  export default {
    props: ['server', 'name'],
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
    methods: {
      selected_images(image){
        this.imageList.push(image);
      },
      delete_image(image){
        this.imageList.splice(this.imageList.indexOf(image),1)
      }
    }
  }
</script>

<style scoped>
  
</style>