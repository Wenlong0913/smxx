<template>
  <div data-page="pay-message" class="page navbar-fixed page-on-center">
    <div class="navbar">
      <div class="navbar-inner">
        <div class="left sliding">
          <a href="#" data-panel="left" class="back link icon-only">
            <i class="icon icon-back"></i>
          </a>
        </div>
        <div class="center">预约服务</div>
        <div class="right sliding">
          <a href="#" data-panel="left" class="open-panel link icon-only">
            <i class="fa fa-bars"></i>
          </a>
        </div>
      </div>
    </div>
    <div class="page-content hide-bars-on-scroll">
      <form class="list-block">
        <!-- 预约信息 -->
        <div class="list-block">
          <ul>
            <li>
              <div class="item-content">
                <div class="item-media">
                  姓名：
                </div>
                <div class="item-inner">
                  <div class="item-title-row">
                    <div class="item-title">{{ user.username }}</div>
                  </div>
                </div>
              </div>

            </li>
            <li>
              <div class="item-content">
                <div class="item-media">
                  电话：
                </div>
                <div class="item-inner">
                  <div class="item-title-row">
                    <div class="item-title">{{ user.mobile_phone }}</div>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </div>

        <!-- 预约项目 -->
        <div class="list-block media-list shop">
          <div class="row" style="padding-left: 16px;">已预约项目</div>
          <ul>
            <li>
              <a href="#" class="item-link item-content">
                <div class="item-media">
                  <img src="./../assets/img/pic1.png" width="80" alt=""></div>
                <div class="item-inner">
                  <div class="item-title-row">
                    <div class="item-title" style="font-size: 16px;">{{ pay_product.name }}</div>
                  </div>
                  <div class="item-subtitle" style="margin-top: 10px;">
                    <i aria-hidden="true" class="fa fa-clock-o"></i> {{ pay_product.service_time }}
                  </div>
                  <div class="color-amber" style="margin-top: 10px;">￥{{ pay_product.sell_price }}</div>
                </div>
              </a>
            </li>
          </ul>
        </div>

        <!-- 门店 -->
        <div class="list-block accordion-list">
          <ul>
            <li class="accordion-item accordion-item-expanded">
              <a href="#" class="item-link item-content">
                <div class="item-inner">
                  <div class="item-title">门店信息</div>
                </div>
              </a>
              <div class="accordion-item-content">
                <div class="content-block">
                  <ul>
                    <li class="item-content">
                      <div class="item-media">
                        <i class="fa fa-home" aria-hidden="true"></i>
                      </div>
                      <div class="item-inner">
                        <div class="item-title-row">
                          <div class="item-title">{{ site.title }}</div>
                        </div>
                      </div>
                    </li>
                     <li class="item-content">
                      <div class="item-media">
                        <i class="fa fa-map-marker" aria-hidden="true"></i>
                      </div>
                      <div class="item-inner">
                        <div class="item-title-row">
                          <div class="item-title">{{ site.address }}</div>
                        </div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </li>
            
          </ul>
        </div>
        
        <div class="content-block">
          <div class="content-block-title">服务时间</div>
          <div style="margin:0" class="list-block">
            <ul>
              <li>
                <div class="item-content">
                  <div class="item-inner">
                    <div class="item-input">
                      <input type="text" placeholder="Date Time" readonly="readonly" id="ks-picker-date"/>
                    </div>
                  </div>
                </div>
              </li>
            </ul>
          </div>
          <div id="ks-picker-date-container"></div>
        </div>
        <div class="buttonbar no-gutter">
          <a href="/pay-message/109" @click="submit()" class="button-fill button color-pink col-100">
            <div class="ripple-wave">
            </div>选好了
          </a>
        </div>
      </form>
      
    </div>
  </div>
</template>

<script>
  import Order from 'services/order'
  import User from 'services/user'
  import Product from 'services/product'
  export default {
    data () {
      return {
        pay_product: [],
        user: [],
        site: []
      }
    },
    mounted () {
      var _this = this
      Product.get(_this.$route.params.id).then(function (response) {
        _this.pay_product = response.data
        _this.site = response.data.site
      })
      User.me(_this).then(function (response) {
        _this.user = response
      })
    },
    methods: {
      submit () {
        var _this = this
        Order.post(this.form).then(function (response) {
          _this.$route.load({ url: '/home' })
        })
      }
    }
  }
</script>