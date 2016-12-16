<template>
  <div> 
    <div id="options" class="m-b-10">
      <span class="gallery-option-set" id="filter" data-option-key="filter">
          <a class="btn btn-default btn-xs active" @click="load_images()">
              所有
          </a>
          <a v-for="tag in tagList"  class="btn btn-default btn-xs" @click="selected_tag(tag)">
              {{tag}}
          </a>
      </span>
    </div>
    <div id="gallery" class="gallery">
      <div class="row">
          <div class="image col-sm-6 col-md-4" v-for="image in imageList">
              <div class="image-inner">
                  <a href="javascript:;" data-lightbox="gallery-group-1">
                      <img :src="image.data.image" alt="" />
                  </a>
                  <p class="image-caption">
                      {{image.name}}
                  </p>
              </div>
              <div class="image-info">
                  <h5 class="title">Lorem ipsum dolor sit amet</h5>
                  <div class="pull-right">
                      <small>by</small> <a href="javascript:;">Sean Ngu</a>
                  </div>
                  <div class="desc">
                      Nunc velit urna, aliquam at interdum sit amet, lacinia sit amet ligula. Quisque et erat eros. Aenean auctor metus in tortor placerat, non luctus justo blandit.
                  </div>
                  <p>
                    <button type="button" class="btn btn-primary btn-xs" :disabled="selectedList.indexOf(image.id) != -1" @click="choose_image(image)">选择</button>
                    <button type="button" class="btn btn-warning btn-xs">编辑</button>
                    <button type="button" class="btn btn-danger btn-xs pull-right" v-on:click="delete_image(image.id)">删除</button>
                  </p>
              </div>
          </div>
      </div>
    </div>
  </div>  
</template>

<script>
  export default {
    props: ['server', 'deleteServer', 'selectedList'],
    data () {
      return {
        imageList: [],
        tagList: []
      }
    },
    mounted() {
      this.load_images();   
    },
    methods: {
      load_images() {
        var vm = this
        vm.$http.get(vm.server).then((data) => {
          vm.imageList = data.body.image_items;
          vm.tagList = data.body.tags;
        }, (response) => {
            // error callback
        });
      },
      selected_tag(name) {
        var vm = this
        vm.$http.get(vm.server, {params: {tag: name}}).then((data) => {
          vm.imageList = data.body.image_items;
        }, (response) => {
            // error callback
        });
      },
      choose_image(image) {
        this.$emit('selected', image);
      },
      delete_image(id) {
        var vm = this;
        if(window.confirm('确定要删除吗?')){
          vm.$http.delete(this.deleteServer+'/'+id).then((data) => {
            var image_index = vm.get_image_index(id);
            if(image_index != -1){
              vm.imageList.splice(image_index, 1)  
            }
          }, (response) => {
              // error callback
          });     
        }    
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

  .gallery {
      margin: 0 -10px;
  }
  .gallery-option-set {
      display: block;
      margin-bottom: -5px;
  }
  .gallery-option-set .btn {
      margin: 0 5px 5px 0;
  }
  .gallery .image {
      width: 25%;
      display: block;
      margin-right: -10px;
      overflow: hidden;
      padding: 10px;
  }
  .gallery .image img {
      width: 100%;
      height: 200px;
      -webkit-border-radius: 3px 3px 0 0;
      -moz-border-radius: 3px 3px 0 0;
      border-radius: 3px 3px 0 0;
  }
  .gallery .image-inner {
      position: relative;
      background: #fff;
      -webkit-border-radius: 3px 3px 0 0;
      -moz-border-radius: 3px 3px 0 0;
      border-radius: 3px 3px 0 0;
  }
  .gallery .image a {
      -webkit-transition: all .2s linear;
      -moz-transition: all .2s linear;
      transition: all .2s linear;
  }
  .gallery .image a:hover,
  .gallery .image a:focus {
      opacity: 0.8;
      filter: alpha(opacity=80);
  }
  .gallery .image-caption {
      position: absolute;
      top: 15px;
      left: 0;
      /*background: url(./img/black6.png);*/
      background: rgba(0,0,0,0.6);
      color: #fff;
      padding: 5px 15px;
      margin: 0;
  }
  .gallery .image-info {
      background: #fff;
      padding: 15px;
      -webkit-border-radius: 0 0 3px 3px;
      -moz-border-radius: 0 0 3px 3px;
      border-radius: 0 0 3px 3px;
  }
  .gallery .image-info .title {
      margin: 0 0 10px;
      line-height: 18px;
      font-size: 14px;
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
  }
  .gallery .image-info .rating {
      line-height: 20px;
      margin: 0 0 3px;
  }
  .gallery .image-info .desc {
      line-height: 16px;
      font-size: 12px;
      height: 48px;
      overflow: hidden;
  }
  .gallery .rating span.star {
      font-family: FontAwesome;
      display: inline-block;
  }
  .gallery .rating span.star:before {
      content: "\f005";
      color: #999;
  }
  .gallery .rating span.star.active:before {
      color: #FF8500;
  }

</style>