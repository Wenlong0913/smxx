<template>
<div data-page="site" class="page navbar-fixed page-on-center">
  <div class="navbar">
    <div class="navbar-inner">
      <div class="left sliding">
        <a href="#" class="back link"><i class="icon icon-back"></i></a>
      </div>
      <div class="center"> 淘美客 | 美容院</div>
      <div class="right">
        <a href="#" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
      </div>
    </div>
  </div>

  <div class="page-content hide-bars-on-scroll">
    <div class="content-block" style="margin: 10px 0;">
      <div class="row" v-for="site in sites">
        <div class="card tablet-50">
          <div class="banner productblock">
            <img :src="site.last_image" class="col-100" :alt="site.title" > 
              <a class="cartfloating floating-button" :href="/sites/ + site.id"><i class="fa fa-eye"></i>
              </a>
          </div>
          <div class="content-block productdata">
            <ul class="socials">
              <li v-for="pro in site.properties" class="item_li">
                <i class="fa fa-tags color-green"></i>{{ pro }}
              </li>
            </ul>
            <h2 class="maintitle col-100 margin_title_5">{{ site.title }}</h2>
            <p class="item_address_p">{{ site.address.name }}</p>
            <div class="row">
              <div class="col-100">
                <p class="item-subtitle margin_start_5 item_star" v-if="site.score == 5">
                  <span class="fa fa-star color_pink" v-for="s in site.score"></span>
                  <span class="color_pink">顶级</span>
                </p>
                <p class="item-subtitle item_star margin_start_5" v-else>
                  <span class="fa fa-star color_pink" v-for="s in site.score"></span>
                </p>
              </div>
            </div>
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