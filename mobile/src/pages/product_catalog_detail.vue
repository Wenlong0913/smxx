<template>
<div data-page="productdetail" class="page navbar-fixed page-on-center">
  <!-- navbar -->
  <div class="navbar">
    <div class="navbar-inner">
      <div class="left sliding">
        <a href="#" data-panel="left" class="back link icon-only">
          <i class="icon icon-back"></i>
        </a>
      </div>
      <div class="center">{{ product_detail.name }}</div>
      <div class="right">
        <a @click="input" class="link icon-only">
          <i class="fa fa-cart-plus"></i>
        </a>
      </div>
    </div>
  </div>
  
  <!-- tabs -->
  <div class="toolbar tabbar">
    <div class="toolbar-inner">
      <a href="#tab1" class="button active tab-link">项目介绍</a>
      <a href="#tab2" class="button tab-link">用户评价</a>
    </div>
  </div>
  <!-- page-content -->
  <div class="page-content hide-bars-on-scroll sidebar">
    <div class="tabs">
      <div id="tab1" class=" tab active">
        <div class="row">
          <img :src="image1" class="col-100" alt="banner1">
        </div>
        <div class="prductlist content-block">
          <!-- title -->
          <div class="item-link item-content">
            <div class="item-inner">
              <div class="item-title-row">
                <div class="author" style="font-size: 16px;">{{ product_detail.name }}</div>
              </div>
              <div class="time" style="margin-top: -25px; font-size: 16px;">
                <time datetime="2015-08-30">
                  <i class="fa fa-clock-o"></i> {{ product_detail.service_time }}
                </time>
              </div>
              <div class="clear"></div>
            </div>
          </div>
          <!-- 描述 -->
          <p style="margin: 5px 0;">服务：{{ product_detail.description }}</p>
          <!-- 价格 -->
          <div class="row">
            <p class="col-50 color-default" style="margin: 5px 0; font-size: 16px;"> 
              原价: <span style=" text-decoration:line-through;">￥{{ product_detail.old_price }}</span>
            </p>
            <p class="col-50 color-amber  text-right" style="margin: 5px 0; font-weight: 700; font-size: 16px;">现价: ￥{{ product_detail.sell_price }}</p>
          </div>
           <!-- tags -->
          <div class="row">
            <div class="col-25">
              <i class="fa fa-check-circle-o color-green"></i> {{ product_detail.properties }}
            </div>
          </div>
        </div>
        <hr>
        <div class="content-block">
          <h3 class="col-100">项目介绍</h3>
          <p class="item-text" v-html="product_detail.content"></p>
        </div>
        <hr>
        <div class="content-block">
          <h3 class="col-100">适用人群</h3>
          <p class="item-text">{{ product_detail.responsive_person }}</p>
        </div>
        <hr>
        <div class="content-block">
          <h3 class="col-100">注意事项</h3>
          <p class="item-text">{{ product_detail.warning_message }}</p>
        </div>
      </div>
      <div id="tab2" class=" tab">
        <div class="content-block">
          <h2>评价</h2>  
        </div>
      </div>
    </div>
  </div>

  <!-- toolbar -->
  <div class="toolbar toolbar-bottom">
    <div class="toolbar-inner">
      <div class="col-100" style="height: 48px; line-height: 48px; padding: 0 16px;">需支付 ￥{{ product_detail.sell_price }}</div>
      <a href="#" class="link" @click="input">加入购物车</a>
    </div>
  </div>
</div>
</template>

<script>
  import Product from 'services/product'
  import ShoppingCart from 'services/shopping_cart'
  export default {
    data () {
      return {
        product_detail: [],
        to_site: {},
        image1: {},
        shopping_product: {
          product_id: null,
          amount: 1,
          price: ''
        }
      }
    },
    mounted () {
      var _this = this
      Product.get(_this.$route.params.id).then(function (response) {
        _this.product_detail = response.data
        _this.to_site = response.data.site
        _this.image1 = response.data.images[0].image_url
        _this.shopping_product.product_id = response.data.id
        _this.shopping_product.price = response.data.sell_price
      })
    },
    methods: {
      input: function () {
        var _this = this
        ShoppingCart.input(_this.shopping_product).then(function (response) {
          _this.$router.load({ url: '/shopping-cart' })
        })
      }
    }
  }
</script>