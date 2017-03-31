<template>
<div data-page="site_detail" class="page navbar-fixed">
  <div class="navbar">
    <div class="navbar-inner">
      <div class="left sliding"><a href="/f7-theme/max_solaris/home.html" class="back link"><i class="icon icon-back"></i></a></div>
      <div class="center ">Services list </div>
      <div class="right">
        <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
      </div>
    </div>
  </div>
  <div class="toolbar tabbar">
    <div class="toolbar-inner">
      <a href="#tab1" class="button active tab-link">项目</a>
      <a href="#tab3" class="button tab-link">美容师</a>
      <a href="#tab2" class="button tab-link">简介</a>
    </div>
  </div>
  <div class="page-content">
    <div class="tabs-animated-wrap">
      <div class="tabs">
        <div id="tab1" class=" tab page-content active">
          <div class="item-content userprofile">
            <div class="item-media">
              <img src="./../assets/img/pic1.png" width="44"  alt="">
            </div>
            <div class="item-inner">
              <div class="item-title-row">
                <div class="item-title">{{ site.title }}</div>
              </div>
            </div>
          </div>
          <div class="content-block text-center" >
            <div class="row profile">
              <div class="col-33 profile">
                <i class="fa fa-check-square-o color-green" aria-hidden="true"></i>{{ site.is_sign }}
              </div>
              <div class="col-33 profile">{{ site.site_hours }}</div>
              <div class="col-33 profile">{{ site.contact_number }}</div>
            </div>
            <div class="row profile stats">
              <div class="col-33 profile ">是否签约</div>
              <div class="col-33 profile ">营业时间</div>
              <div class="col-33 profile ">联系电话</div>
            </div>
          </div>
          <hr>
          <article>
            <div class="list-block media-list">
              <ul>
                <li v-for="product in products">
                  <a href="#" class="item-link item-content">
                    <div class="item-media">
                      <img src="./../assets/img/pic1.png" width="80" alt="">
                    </div>
                    <div class="item-inner">
                      <div class="item-title">{{ product.name }}</div>
                      <div class="item-text" style="text-align: center;">{{ product.description }}</div>
                      <div class="color-amber" style="text-align: center;">￥{{ product.sell_price }}</div>
                      <div class="row profile stats">
                        <div class="col-20 profile stats"></div>
                        <div class="col-30 profile stats">{{ product.service_time }}</div>
                        <div class="col-30 profile stats">月售{{ product.month_number }}</div>
                        <div class="col-20 profile stats"></div>
                      </div>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
          </article>
        </div>
        <div id="tab2" class="tab page-content">
          <div class="center content-block">
            <h2>Your photo album</h2>
            <p>2016-2017</p>
          </div>
          <div class="gallery row no-gutter"> 
              <a href="/f7-theme/max_solaris/img/banner1.png" rel="gallery-1" class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner1.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner2.png" rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner2.png" alt="image" class="col-100"> </a> 
              <a href="/f7-theme/max_solaris/img/banner3.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner3.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner4.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner4.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner2.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner2.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner1.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner1.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner2.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner2.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner3.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner3.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner4.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner4.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner1.png" rel="gallery-1" class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner1.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner2.png" rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner2.png" alt="image" class="col-100"> </a> 
              <a href="/f7-theme/max_solaris/img/banner3.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner3.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner4.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner4.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner2.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner2.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner1.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner1.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner2.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner2.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner3.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner3.png" alt="image" class="col-100"> </a>
              <a href="/f7-theme/max_solaris/img/banner4.png"  rel="gallery-1"  class="swipebox col-33" title="My Caption"> <img src="/f7-theme/max_solaris/img/banner4.png" alt="image" class="col-100"> </a>
          </div>
        </div>
        <div id="tab3" class=" page-content tab">
          <div class="list-block media-list">
            <ul>
              <li v-for="">
                <a href="#" class="item-link item-content">
                  <div class="item-media">
                    <img src="/f7-theme/max_solaris/img/pic1.png" width="80" alt=""></div>
                  <div class="item-inner">
                    <div class="item-title-row">
                      <div class="item-title">Yellow Submarine</div>
                      <div class="item-after">$15</div></div>
                    <div class="item-subtitle">Beatles</div>
                    <div class="item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla sagittis tellus ut turpis condimentum, ut dignissim lacus tincidunt. Cras dolor metus, ultrices condimentum sodales sit amet, pharetra sodales eros. Phasellus vel felis tellus. Mauris rutrum ligula nec dapibus feugiat. In vel dui laoreet, commodo augue id, pulvinar lacus.</div></div>
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
        products: []
      }
    },
    mounted () {
      var _this = this
      Site.get(_this.$route.params.id).then(function (response) {
        _this.site = response.data

        _this.products = response.data.products
      })
    }
  }
</script>