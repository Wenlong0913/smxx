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
                <div class="author font_size_16">{{ product_detail.name }}</div>
              </div>
              <div class="time service_timte_right">
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
            <p class="col-100 color_pink price">
              现价: ￥{{ product_detail.sell_price }}
              <span class="service_color text_decoration_line">【￥{{ product_detail.old_price }}】</span>
            </p>
          </div>
           <!-- tags -->
          <div class="row">
            <div class="col-100">
              <ul class="socials">
                <li v-for="pro in product_detail.properties" class="item_li">
                  <i class="fa fa-tags color-green"></i>{{ pro }}
                </li>
              </ul>
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
        <div class="list-block media-list comment">
          <ul class="comment">
            <li v-for="c in comments">
              <div class="item-link item-content">
                <div class="item-media">
                  <img src="./../assets/img/comment_dude.svg" style="border-radius:100%" width="40" height="40" alt="">
                </div>
                <div class="item-inner">
                  <div class="item-title-row">
                    <div class="item-title author-comment">{{c.name}}</div>
                  </div>
                  <div class="time">{{c.time}}前</div>
                  <div class="comment" style="font-size: 13px;">{{c.content}}</div>
                </div>
              </div>
            </li>
          </ul>
        </div>
        <hr>
        <div class="list-block ">
          <ul class="message-comment">
            <li class="align-top">
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-input">
                    <textarea placeholder="请在这里写下您的评价"></textarea>
                  </div>
                </div>
              </div>
            </li>
            <li class="content-block">
              <a href="#" class="button button-fill">提交评价</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>

  <!-- toolbar -->
  <div class="toolbar toolbar-bottom">
    <div class="toolbar-inner">
      <div class="col-100 toolbar_bottom_left">价格 ￥{{ product_detail.sell_price }}</div>
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
        },
        comments: [
          {
            name: '匿名用户',
            time: '2分钟',
            content: '哈哈，又发现了一个手法不错的妹子，而且还住这么近，真是太好了，妹子按得很仔细，还讲解了很多养生的小知识，已办套餐'
          },
          {
            name: '匿名用户',
            time: '12分钟',
            content: '做完之后感觉皮肤都白些了。还免费帮我修了杂乱的眉毛。超级感谢'
          },
          {
            name: '匿名用户',
            time: '32分钟',
            content: '很不错的美容师，细节做得也很到位，超出期待！'
          },
          {
            name: '匿名用户',
            time: '1小时',
            content: '太好了，实在太舒服，谁做谁知道。太好了，实在太舒服，谁做谁知道。太好了，实在太舒服，谁做谁知道。'
          }
        ]
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