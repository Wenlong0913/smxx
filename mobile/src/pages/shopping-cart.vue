<template>
  <div data-page="shopping-cart" class="page navbar-fixed page-on-center">
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding">
          <a href="#" data-panel="left" class="back link icon-only">
            <i class="icon icon-back"></i>
          </a>
        </div>
        <div class="center">购物车列表</div>
        <div class="right sliding">
          <a href="#" data-panel="left" class="open-panel link icon-only">
            <i class="fa fa-bars"></i>
          </a>
        </div>
        
      </div>
    </div>
    <div class="page-content hide-bars-on-scroll">
      <div class="prductlist content-block">
        <div class="list-block media-list shop">
          <ul>
            <li class="card_border item_cart" v-for="order in orders.data">
              <div class="item-title-row padding_auto_16">
                <div class="item-title font_title_size">
                  <i class="fa fa-home"></i>
                  {{ order.product.site.title }}
                </div>
                <div class="item-after">未支付</div>
              </div>
              <div class="item-content">
                <div class="item-media">
                  <img src="./../assets/img/product1.jpg" width="80">
                </div>
                <div class="item-inner">
                  <div class="item-title-row">
                    <div class="item-title" style="font-size: 14px;">{{ order.product.name }}</div>
                  </div>
                  <div class="item-text" style="margin-top: 6px;">预约时间：9:00-22:00</div>
                  <div class="item-text" style="margin-top: 6px;">地址：{{ order.product.site.address}}</div>
                </div>
              </div>
              <div class="row" style="">
                <div class="col-70 cart_after">
                  等待付款 <span class="color-amber">￥ {{ order.price }}</span>
                </div>
                <div class="col-30">
                  <a href="" class="button button-fill button-raised color-pink change_btn_pay">去支付</a>
                </div>
              </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import ShoppingCart from 'services/shopping_cart'
  export default {
    data () {
      return {
        orders: []
      }
    },
    mounted () {
      var _this = this
      ShoppingCart.get(this).then(function (response) {
        _this.orders = response.data
      })
    }
  }
</script>