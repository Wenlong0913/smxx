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
      <div class="list-block media-list shop">
        <ul>
          <li  v-for="product in products">
            <a :href="/product_catalog_detail/ + product.id" class="item-link item-content">
              <div class="item-media">
                <img src="./../assets/img/pic1.png" width="80" alt="">
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