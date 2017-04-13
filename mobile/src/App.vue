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
                  <div class="item-title">请先登录</div>
                </div>
                <div class="item-subtitle"></div>
              </div>
            </div>
            <div class="page-content">
              <div class="list-block accordion-list">
                <ul class="menu">
                  <li class="accordion-item">
                    <a href="#" class="item-content item-link">
                      <div class="item-inner">
                        <div class="item-title"><i class="fa fa-th-list"></i>项目</div>
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
                      <div class="itemmeniinner"><i class="fa fa-female"></i><span>美容师</span>
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
                        <div class="item-title"><i class="fa fa-shopping-bag"></i>订单</div>
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
                          <li><a href="/information_center/" class="item-link close-panel"><span>信息中心</span></a>
                          </li>
                          <li><a href="/invitation_code/" class="item-link close-panel"><span>邀请码</span></a>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </li>

                  <li>
                    <a href="/about/" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-users"></i><span>关于我们</span>
                      </div>
                    </a>
                  </li>

                  <li>
                    <a href="/contact/" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-phone"></i><span>联系我们</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="/login/" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-undo"></i><span>退出登录</span>
                      </div>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="buttonbar row no-gutter">
              <a href="" class=" button color2 col-100">在线预约</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <div class="panel panel-right panel-cover sidebar">
      <div class="view">
        <div class=" ">
          <div data-page="about" class="sidemenu leftmenusmall ">
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
        <!-- Pages -->
        <f7-pages>
          <f7-page>
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

            <div class="page-content hide-bars-on-scroll">
              <div data-pagination=".swiper-pagination" data-paginationHide="true" class="swiper-container largebanner swiper-init" style="height: 70%;">
                <div class="swiper-pagination"></div>
                <div class="swiper-wrapper">
                  <div class="swiper-slide gradient">
                    <div class="textblock">
                      <img src="./assets/img/icon.png" alt="" class="iconimg">
                      <h2 class="maintitle col-100">水逆大作战</h2>
                      <h5 class="col-100">12星座的指尖魔法，美甲×星座</h5>
                      <h5 class="col-100">4月1日—4月9日</h5>
                      <a href="#" class="button button-fill">立即查看</a>
                    </div>
                    <img src="./assets/img/banner1.png" alt="">
                    <img src="./assets/img/banner_top.png" alt="" class="bottomoverlay">
                  </div>
                  <div class="swiper-slide gradient">
                    <div class="textblock">
                      <img src="./assets/img/icon.png" alt="" class="iconimg">
                      <h2 class="maintitle col-100 ">春季补水限定款</h2>
                      <h5 class="col-100">让整个假期都水润满分</h5> 
                      <h5 class="col-100">全场138元起</h5> 
                      <a href="#" class="button button-fill">立即查看</a>
                    </div>
                    <img src="./assets/img/banner3.png" alt="">
                    <img src="./assets/img/banner_top.png" alt="" class="bottomoverlay">
                  </div>
                  <div class="swiper-slide gradient" >
                    <div class="textblock">
                      <img src="./assets/img/icon.png" alt="" class="iconimg">
                      <h2 class="maintitle col-100 ">新人专享28元起</h2>
                      <h5 class="col-100">更有免单机会每天抽</h5>
                      <a href="#" class="button button-fill">立即抽奖</a>
                    </div>
                    <img src="./assets/img/banner2.png" alt="">
                    <img src="./assets/img/banner_top.png" alt="" class="bottomoverlay">
                  </div>
                </div>
              </div>

              <div class="content-block">
                <div class="row no-gutter">
                  <div class="col-25">
                    <div class="prductlist content-block center">
                      <span class="fa fa-child titleicon"></span>面部
                    </div>
                  </div>
                  <div class="col-25">
                    <div class="prductlist content-block center">
                      <span class="fa fa-user-md titleicon"></span>养生
                    </div>
                  </div>
                  <div class="col-25">
                    <div class="prductlist content-block center">
                      <span class="fa fa-female titleicon"></span>按摩
                    </div>
                  </div>
                  <div class="col-25">
                    <div class="prductlist content-block center">
                      <span class="fa fa-street-view titleicon"></span>美发
                    </div>
                  </div>
                  <div class="col-25">
                    <div class="prductlist content-block center">
                      <span class="fa fa-flag titleicon"></span>活动
                    </div>
                  </div>
                  <div class="col-25">
                    <div class="prductlist content-block center">
                      <span class="fa fa-hourglass-end titleicon"></span>积分
                    </div>
                  </div>
                  <div class="col-25">
                    <div class="prductlist content-block center">
                      <span class="fa fa-coffee titleicon"></span>热搜
                    </div>
                  </div>
                  <div class="col-25">
                    <div class="prductlist content-block center">
                      <span class="fa fa-list titleicon"></span>分类
                    </div>
                  </div>
                </div>
              </div>
              <hr>

              <div class="center content-block">
                <h2><i class="fa fa-bullhorn">&nbsp;</i>今日必抢</h2>
                <p>每一款产品都是精心打造</p>
              </div>
              <div class="gallery row"> 
                <div class="gallery row no-gutter"> 
                  <a href="" rel="gallery-1" class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner1.png" alt="image" class="col-100">
                  </a>
                  <a href="" rel="gallery-1"  class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner2.png" alt="image" class="col-100">
                  </a> 
                  <a href=""  rel="gallery-1"  class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner3.png" alt="image" class="col-100">
                  </a>
                  <a href=""  rel="gallery-1"  class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner4.png" alt="image" class="col-100">
                  </a>
                  <a href=""  rel="gallery-1"  class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner2.png" alt="image" class="col-100">
                  </a>
                  <a href=""  rel="gallery-1"  class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner1.png" alt="image" class="col-100">
                  </a>
                  <a href=""  rel="gallery-1"  class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner2.png" alt="image" class="col-100">
                  </a>
                  <a href=""  rel="gallery-1"  class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner3.png" alt="image" class="col-100">
                  </a>
                  <a href=""  rel="gallery-1"  class="swipebox col-33" title="My Caption">
                    <img src="./assets/img/banner4.png" alt="image" class="col-100">
                  </a>
                </div>
              </div>

              <div class="darkbgblock center content-block gradient">
                <span class="fa fa-diamond titleicon"></span>
                <h2>淘美客新人注册有礼啦！</h2>
                <p>现在起立即注册加入会员，即可获得淘美客送出的超值大礼包！悄悄告诉你，邀请好友注册还有返现红包哦！</p>
                <a href="/login/" class="button button-raised button-fill color-blue">立 即 领 取</a>
                <img class="imgdevidertext" src="./assets/img/banner4.png" alt="">
              </div>

              <div class="center content-block">
                <h2><i class="fa fa-gift">&nbsp;</i>好店推荐</h2>
                <p>每一家门店都是细心筛选</p>
              </div>
              <div class="gallery row"> 
                <a href="" rel="gallery-1" class="swipebox col-50" title="My Caption">
                  <img src="./assets/img/banner1.png" alt="image" class="col-100">
                </a>
                <a href="" rel="gallery-1"  class="swipebox col-50" title="My Caption">
                  <img src="./assets/img/banner2.png" alt="image" class="col-100">
                </a> 
                <a href=""  rel="gallery-1"  class="swipebox col-50" title="My Caption">
                  <img src="./assets/img/banner3.png" alt="image" class="col-100">
                </a>
                <a href=""  rel="gallery-1"  class="swipebox col-50" title="My Caption">
                  <img src="./assets/img/banner4.png" alt="image" class="col-100">
                </a>
              </div>
              <hr>

              <div class="content-block  center">
                <span class="">Copyright 2017. All Rights Reserved. </span>
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
