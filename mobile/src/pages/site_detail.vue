<template>
<div data-page="site_detail" class="page navbar-fixed">
  <div class="navbar">
    <div class="navbar-inner">
      <div class="left sliding">
        <a href="#" class="back link"><i class="icon icon-back"></i></a>
      </div>
      <div class="center "> {{ site.title }} | 美容院</div>
      <div class="right">
        <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
      </div>
    </div>
  </div>
  <div class="toolbar tabbar">
    <div class="toolbar-inner">
      <a href="#tab1" class="button active tab-link">介绍</a>
      <a href="#tab3" class="button tab-link">美容项目</a>
      <a href="#tab2" class="button tab-link">美容师</a>
    </div>
  </div>
  <div class="page-content">
    <div class="tabs-animated-wrap">
      <div class="tabs">
        <div id="tab1" class=" tab page-content active">
          <div data-pagination=".swiper-pagination" data-effect="coverflow" data-slidesPerView="auto" data-centeredSlides="true" class="swiper-container swiper-init ks-demo-slider ks-coverflow-slider">
            <div class="swiper-pagination"></div>
            <div class="swiper-wrapper">
              <div style="background-image:url(./../img/pic1.png)" class="swiper-slide">Slide 1</div>
              <div style="background-image:url(./../img/banner2.png)" class="swiper-slide">Slide 2</div>
              <div style="background-image:url(./../img/banner3.png)" class="swiper-slide">Slide 3</div>
              <div style="background-image:url(./../img/banner4.png)" class="swiper-slide">Slide 4</div>
            </div>
          </div>
          <div class="prductlist content-block text-center">
            <h2 class="maintitle col-100">
              {{ site.title }}
            </h2>
            <p class="item-subtitle margin_start_5 item_star" v-if="site.score == 5">
              <span class="fa fa-star color_pink" v-for="s in site.score"></span>
              <span class="color_pink">顶级</span>
            </p>
            <p class="item-subtitle item_star margin_start_5" v-else>
              <span class="fa fa-star color_pink" v-for="s in site.score"></span>
            </p>
          </div>
          <hr>
          <div class="content-block text-center" >
            <div class="row profile">
              <div class="col-33 profile">
                <i class="fa fa-check-square-o color-green" aria-hidden="true"></i>
                {{ site.is_sign }}
              </div>
              <div class="col-33 profile">
                <i class="fa fa-clock-o color-green" aria-hidden="true"></i>
                {{ site.site_hours }}
              </div>
              <div class="col-36 profile">
                <i class="fa fa-phone color-green" aria-hidden="true"></i>
                {{ site.contact_number }}
              </div>
            </div>
            <div class="row profile stats">
              <div class="col-33 profile ">
                状态
              </div>
              <div class="col-33 profile ">
                营业时间
              </div>
              <div class="col-33 profile ">
                联系电话
              </div>
            </div>
          </div>
          <div class="content-block">
            <h3 class="col-100">美容院介绍</h3>
            <p class="item-text" v-html="site.content"></p>
          </div>
          <div class="center content-block ">
            <div class="">
              <img src="./../assets/img/phone.png" alt="">
            </div>
            <a :href="'tel:' + site.contact_number ">(Tel) :{{ site.contact_number }}</a>
            <p class="">联系我们</p>
          </div>
        </div>
        <!-- 美容师 -->
        <div id="tab2" class="tab page-content">
          <div class="content-block">
            <div class="row">
              <div class="card tablet-50" v-for="staff in staffs">
                <div class="card-content"> 
                  <div class="banner productblock">
                    <f7-link :href="'/staffs/' + staff.id" v-for="images in staff.images">
                      <img :src="images.image_url" :alt="images.title" class="col-100" />
                    </f7-link>
                    <a class="cartfloating floating-button" :href="'/staffs/' + staff.id"><i class="fa fa-magic"></i></a>
                  </div>
                  <div class="content-block productdata">
                    <h2 class="maintitle col-100">美容师：{{staff.title}}</h2>
                    <div class="item-subtitle star color-amber ">
                      <i class="fa fa-star" v-for="star in staff.sco"></i>
                    </div>
                    <p class="col-100">
                      <span>年龄：{{staff.age}}岁</span>
                      <span>工作年限：{{staff.work_years}}年</span>
                    </p>
                    <p class="col-100">擅长领域：{{staff.pro}}</p>
                    <div class="clear"></div>
                  </div>
                  <div class="clear"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div id="tab3" class=" page-content tab">
          <div class="list-block media-list shop">
            <ul>
              <li v-for="product in products">
                <a :href="/product_catalog_detail/ + product.id" class="item-link item-content">
                  <div class="item-media">
                    <img :src="product.images[0].image_url" width="80" :alt="product.name">
                  </div>
                  <div class="item-inner">
                    <div class="item-title" style="font-size: 16px;">{{ product.name }}</div>
                    <div class="item-text" style="text-align: center;">{{ product.description }}</div>
                    <div class="color-amber" style="text-align: center;">￥{{ product.sell_price }}</div>
                    <div class="item-text" style="text-align: center;">{{ product.service_time }} 月售{{ product.month_number }}</div>
                  </div>
                </a>
              </li>
            </ul>
          </div>
          
        </div>
      </div>
    </div>
  </div>
</div>
</template>
<script>
  import Site from 'services/site'
  export default {
    data () {
      return {
        site: [],
        products: [],
        image_list: [],
        staffs: []
      }
    },
    mounted () {
      var _this = this
      Site.get(_this.$route.params.id).then(function (response) {
        _this.site = response.data
        _this.image_list = response.data.images
        _this.products = response.data.products
        _this.staffs = response.data.staffs
      })
    }
  }
</script>