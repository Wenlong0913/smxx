<template>
<div data-page="productdetail" class="page navbar-fixed page-on-center">
  <div class="navbar">
    <div class="navbar-inner">
      <div class="left sliding">
        <a href="#" data-panel="left" class="back link icon-only">
          <i class="icon icon-back"></i>
        </a>
      </div>
      <div class="center">美客美</div>
      <div class="right">
        <a  @click="input" class="link icon-only">
          <i class="fa fa-cart-plus"></i>
        </a>
      </div>
    </div>
  </div>
  <div class="page-content hide-bars-on-scroll sidebar">
    <div class="row">
      <img :src="image1" class="col-100" alt="banner1">
    </div>
    <div class="prductlist  content-block">
      <h2 class="maintitle col-100">{{ product_detail.name }}</h2>
      <h3 class="col-100 color-green">￥ {{ product_detail.sell_price }}</h3>
      <div class="item-subtitle star color-amber ">★★★★☆</div>
      <p class="">{{ product_detail.description }}</p>
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
    <hr/>
    <div class="buttonbar no-gutter">
      <a class="cartfloating floating-button" @click="input">
        <i class="fa fa-cart-plus"></i>
      </a>
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