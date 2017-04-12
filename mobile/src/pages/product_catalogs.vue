<template>
  <div data-page="product_catalogs" class="page navbar-fixed">
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left">
          <a href="#" class="back link icon-only">
            <i class="icon icon-back"></i>
          </a>
        </div>
        <div class="center"> {{ catalog.name }} | 美客美</div>
        <div class="right">
          <a href="" class="open-panel link icon-only"><i class="icon icon-bars"></i></a>
        </div>
      </div>
    </div>
    <div class="page-content">
      <div class="content-block" style="margin: 10px 0;">
        <div class="row" v-for="product in products">
          <div class="card tablet-50">
            <div class="banner productblock">
              <img :src="product.images[0].image_url" class="col-100" :alt="product.name" > 
                <a class="cartfloating floating-button" :href="/product_catalog_detail/ + product.id"><i class="fa fa-eye"></i>
                </a>
            </div>
            <div class="content-block productdata">
              <h2 class="maintitle col-100 margin_title_5">{{ product.name }}</h2>
              <ul class="socials">
                <li v-for="pro in product.properties" class="item_li">
                  <i class="fa fa-tags color-green"></i>{{ pro }}
                </li>
              </ul>
              <div class="row margin_top_5">
                <div class="col-100 color_pink site_title">
                  ￥{{ product.sell_price }}
                </div>
                <div class="col-100 service_color">
                  <i class="fa fa-clock-o"></i> {{ product.service_time }}
                </div>
              </div>
              <div class="row">
                <div class="col-100">
                  <p class="item-subtitle margin_start_5 item_star" v-if="product.score == 5">
                    <span class="fa fa-star color_pink" v-for="s in product.score"></span>
                    <span class="color_pink">顶级</span>
                  </p>
                  <p class="item-subtitle item_star margin_start_5" v-else>
                    <span class="fa fa-star color_pink" v-for="s in product.score"></span>
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
  import ProductCatalog from 'services/product_catalog'
  export default {
    data () {
      return {
        catalog: [],
        products: []
      }
    },
    mounted () {
      var _this = this
      ProductCatalog.get(_this.$route.params.id).then(function (response) {
        _this.catalog = response.data
        _this.products = response.data.products
      })
    }
  }
</script>