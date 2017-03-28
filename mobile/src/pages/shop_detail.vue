<template>
  <div data-page="shopping_category" class="page navbar-fixed" >
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding"><a href="/f7-theme/max_solaris/home.html" class="back link"><i class="icon icon-back"></i></a></div>
        <div class="center ">Shoping category </div>
          <div class="right"><a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a></div>
      </div>
    </div>
    <div class="page-content hide-bars-on-scroll">
      <div data-page="productdetail" class="page navbar-fixed" >
  <div class="navbar">
    <div class="navbar-inner">
      <div class="left sliding"><a href="/f7-theme/max_solaris/home.html" class="back link"><i class="icon icon-back"></i></a></div>
      <div class="center ">Product Details</div>
        <div class="right"><a href="/f7-theme/max_solaris/cart.html" class=" link icon-only"><i class="fa fa-cart-plus"></i></a></div>
    </div>
  </div>
  <div class="page-content hide-bars-on-scroll">
      <div class="row">
        <div v-for="img in shop.images">
          <img :src="img.image_url" class="col-100" alt="banner1" />
        </div>
      </div>
      <div class="prductlist  content-block">
          <h2 class="maintitle col-100 ">{{shop.name}}</h2>
          <h3 class="col-100 color-green">$ 500</h3>
          <div class="item-subtitle star color-amber ">★★★★☆</div>
          <p class="">{{shop.description}}</p>
      </div>
      <hr>
      <div class="content-block productdata ">
          <h3 class="col-100">Description</h3>
          <p v-html="shop.content"></p>
      </div>
        <hr>
        <div class="content-block">
              <h2 class="center">We are at social</h2>
              <p class="center">Get connected with us on social</p>
              <ul class="socials">
                  <li><a href="" class="fb"><i class="fa fa-facebook"></i></a></li>
                  <li><a href="" class="tw"><i class="fa fa-twitter"></i></a></li>
                  <li><a href="" class="gp"><i class="fa fa-google-plus"></i></a></li>
                  <li><a href="" class="pin"><i class="fa fa-pinterest"></i></a></li>
                  <li><a href="" class="env"><i class="fa fa-envelope"></i></a></li>
              </ul>
        </div>
        <hr>
        <div class="content-block  center">
            <span class="">Copyright 2016. All Rights Reserved. </span>
        </div>

      </div>
      <a class="cartfloating floating-button " href="/f7-theme/max_solaris/cart.html"><i class="fa fa-cart-plus"></i></a>
      </div>

    </div>
  </div>
</template>

<script>
import Shop from 'services/shop'
export default {
  data () {
    return {
      shop: []
    }
  },
  mounted: function () {
    var _this = this
    Shop.get(_this.$route.params.id).then(function (response) {
      _this.shop = response.data
    })
  }
}
</script>
