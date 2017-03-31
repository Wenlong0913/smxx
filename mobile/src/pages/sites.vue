<template>
<div data-page="site" class="page navbar-fixed page-on-center">
  <div class="navbar">
    <div class="navbar-inner">
      <div class="left">
        <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
      </div>
      <div class="center">美容院</div>
    </div>
  </div>

  <div class="page-content hide-bars-on-scroll">
    <div class="productlist content-block">
      <div class="row" v-for="site in sites">
        <div class="card tablet-50">
          <div class="banner productblock">
            <img :src="site.images[0].image_url" class="col-100" alt="banner1"> 
              <a class="cartfloating floating-button" :href="/sites/ + site.id"><i class="fa fa-eye"></i>
              </a>
          </div>
          <div class="content-block productdata">
            <h2 class="maintitle col-100 ">{{ site.title }}</h2>
            <h3 class="col-100"><i class="fa fa-thumb-tack"></i>{{ site.address }}</h3>
            <div class="item-subtitle star color-amber ">★★★★☆</div>
            <div class="clear"></div>
          </div>
          <div class="clear"></div>
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
      sites: []
    }
  },
  mounted () {
    let _this = this
    Site.list().then(function (response) {
      _this.sites = response.data
    })
  }
}
</script>