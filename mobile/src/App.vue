<template>
  <!-- App -->
  <div id="app">
    <div class="statusbar-overlay"></div>
    <div class="panel-overlay"></div>
    <div class="panel panel-left panel-reveal sidebar">
      <div class="view">
        <div class=" ">
          <div data-page="panel-left" class="sidemenu leftmenusmall ">
            <div class="item-content userprofile">
              <div class="item-media"><img src="./assets/img/pic1.png" width="44" />
              </div>
              <div class="item-inner">
                <div class="item-title-row">
                  <div class="item-title">宋学江</div>
                </div>
                <div class="item-subtitle">成都</div>
              </div>
            </div>
            <div class="page-content">
              <div class="list-block accordion-list">
                <ul class="menu">
                  <li class="accordion-item">
                    <a href="#" class="item-content item-link">
                      <div class="item-inner">
                        <div class="item-title"><i class="fa fa-home"></i>项目</div>
                      </div>
                    </a>
                    <div class="accordion-item-content">
                      <div class="content-block">
                        <ul>
                          <li v-for="catalog in product_catalogs">
                            <f7-link :href="/product_catalogs/ + catalog.id" class="item-link close-panel"><span>{{catalog.name}}</span></f7-link>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </li>

                  <li>
                    <a href="/staffs/" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-music"></i><span>美容师</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="/sites/" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-music"></i><span>美容院</span>
                      </div>
                    </a>
                  </li>

                  <li class="accordion-item">
                    <a href="#" class="item-content item-link">
                      <div class="item-inner">
                        <div class="item-title"><i class="fa fa-briefcase"></i>订单</div>
                      </div>
                    </a>
                    <div class="accordion-item-content">
                      <div class="content-block">
                        <ul>
                          <li><a href="/services.html" class="item-link close-panel"><span>未完成</span></a>
                          </li>
                          <li><a href="/services.html" class="item-link close-panel"><span>已使用</span></a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </li>

                  <li class="accordion-item">
                    <a href="#" class="item-content item-link">
                      <div class="item-inner">
                        <div class="item-title"><i class="fa fa-briefcase"></i>我的</div>
                      </div>
                    </a>
                    <div class="accordion-item-content">
                      <div class="content-block">
                        <ul>
                          <li><a href="/services.html" class="item-link close-panel"><span>预约人管理</span></a>
                          </li>
                          <li><a href="/services.html" class="item-link close-panel"><span>信息中心</span></a>
                          </li>
                          <li><a href="/services.html" class="item-link close-panel"><span>邀请码</span></a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </li>

                  <li>
                    <a href="/about/" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-user"></i><span>关于我们</span>
                      </div>
                    </a>
                  </li>

                  <li>
                    <a href="/contact/" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-music"></i><span>联系我们</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="buttonbar row no-gutter">
              <a href="/f7-theme/max_solaris/sign-in.html" class=" button color2 col-100">在线预约</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="panel panel-right panel-cover sidebar">
      <div class="view">
        <div class=" ">
          <div data-page="panel-left" class="sidemenu leftmenusmall ">
            <div class="item-content userprofile">
              <div class="item-media"><img src="./assets/img/pic1.png" width="44" alt="" />
              </div>
              <div class="item-inner">
                <div class="item-title-row">
                  <div class="item-title">美客美美容</div>
                </div>
                <div class="item-subtitle">India</div>
              </div>
            </div>
            <div class="page-content">
              <div class="inputs-list content-block">
                <h2 class="maintitle  center">联系我们</h2>
                <p class="center">我们将回复您提供的电子邮件地址</p>
              </div>
              <div class="list-block inputs-list">
                <ul>
                  <li>
                    <div class="item-content">
                      <div class="item-inner">
                        <div class="item-title">姓名</div>
                        <div class="item-input item-input-field">
                          <input type="text" placeholder="" />
                        </div>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="item-content">
                      <div class="item-inner">
                        <div class="item-title">邮箱</div>
                        <div class="item-input item-input-field">
                          <input type="email" placeholder="" />
                        </div>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="item-content">
                      <div class="item-inner">
                        <div class="item-title ">电话</div>
                        <div class="item-input item-input-field">
                          <input type="tel" placeholder="" />
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="align-top">
                    <div class="item-content">
                      <div class="item-inner">
                        <div class="item-title">留言备注</div>
                        <div class="item-input item-input-field">
                          <textarea class="resizable"></textarea>
                        </div>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
              <div class="content-block"> <a href="/f7-theme/max_solaris/home.html" class="button button-fill ">发给我们</a> </div>
              <hr>
              <div class="content-block">
                <h2 class="center">We are at social</h2>
                <p class="center">Get connected with us on social</p>
                <ul class="socials">
                  <li><a href="" class="fb"><i class="fa fa-facebook"></i></a>
                  </li>
                  <li><a href="" class="tw"><i class="fa fa-twitter"></i></a>
                  </li>
                  <li><a href="" class="gp"><i class="fa fa-google-plus"></i></a>
                  </li>
                  <li><a href="" class="pin"><i class="fa fa-pinterest"></i></a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Main Views -->
    <f7-views>
      <f7-view id="main-view" :dynamic-navbar="true" main>
        <!-- Navbar -->
        <f7-navbar>
          <f7-nav-left>
            <f7-link icon="icon-bars" open-panel="left"></f7-link>
          </f7-nav-left>
          <f7-nav-center>
            <small>  mokomo---美容O2O新概念</small>
          </f7-nav-center>
          <f7-nav-right>
            <f7-link icon="fa fa-user" href="/about/"></f7-link>
          </f7-nav-right>
        </f7-navbar>
        <!-- Pages -->
        <f7-pages>
          <f7-page>
            <div class="page-content landingpage gradient">
              <div class="logo main col12">
                <img src="./assets/img/icon.png" alt=""> </div>
              <div class="introtext">
                <h1> 美客美<br>定制私人美容</h1>
                <p>专业优质的社区美容服务</p>
              </div>
              <div class="buttonbar  no-gutter">
                <a href="/login" class="button-fill button color-pink col">用户登录</a>
              </div>
            </div>
          </f7-page>
        </f7-pages>

      </f7-view>
    </f7-views>
  </div>
</template>

<script>
import { mapState } from 'vuex'
import { CHANGE_LOADING_STATUS } from 'store/modules/common'
import main from './components/main'
import ProductCatalog from 'services/product_catalog'

export default {
  components: { 'my-main': main },

  data () {
    return {
      product_catalogs: []
    }
  },
  computed: {
    ...mapState({
      isLoading: state => state.common.isLoading
    })
  },
  mounted () {
    let _this = this
    this.$store.commit(CHANGE_LOADING_STATUS, {isLoading: true})
    setTimeout(function () {
      this.$store.commit(CHANGE_LOADING_STATUS, {isLoading: false})
    }.bind(this), 5000)
    // get product_catalogs
    ProductCatalog.list().then(function (response) {
      _this.product_catalogs = response.data
    })
  }
}
</script>
