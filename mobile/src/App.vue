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
                          <li><a href="/f7-theme/max_solaris/f7-theme/max_solaris/home.html" class="item-link close-panel"><span>面部</span></a>
                          </li>
                          <li><a href="/f7-theme/max_solaris/home_classic.html" class="item-link close-panel"><span>养生</span></a>
                          </li>
                          <li><a href="/f7-theme/max_solaris/home_dashboard.html" class="item-link close-panel"><span>身体</span></a>
                          </li>
                          <li><a href="/f7-theme/max_solaris/home_reader.html" class="item-link close-panel"><span>美发</span></a>
                          </li>
                        </ul>
                      </div>
                    </div>
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
                    <a href="/f7-theme/max_solaris/contacts.html" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-user"></i><span>关于我们</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="/f7-theme/max_solaris/messages.html" class="item-link close-panel item-content ">
                      <div class="itemmeniinner"><i class="fa fa-comment-o"></i><span>在线客服</span>
                      </div>
                    </a>
                  </li>
                  <li>
                    <a href="/f7-theme/max_solaris/lists.html" class="item-link close-panel item-content ">
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
                  <div class="item-title">Max Smith</div>
                </div>
                <div class="item-subtitle">India</div>
              </div>
            </div>
            <div class="page-content">
              <div class="inputs-list content-block">
                <h2 class="maintitle  center">Contact us</h2>
                <p class="center">We will be back on your provided email address</p>
              </div>
              <div class="list-block inputs-list">
                <ul>
                  <li>
                    <div class="item-content">
                      <div class="item-inner">
                        <div class="item-title">Your name</div>
                        <div class="item-input item-input-field">
                          <input type="text" placeholder="" />
                        </div>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="item-content">
                      <div class="item-inner">
                        <div class="item-title">E-mail</div>
                        <div class="item-input item-input-field">
                          <input type="email" placeholder="" />
                        </div>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div class="item-content">
                      <div class="item-inner">
                        <div class="item-title ">Phone</div>
                        <div class="item-input item-input-field">
                          <input type="tel" placeholder="" />
                        </div>
                      </div>
                    </div>
                  </li>
                  <li class="align-top">
                    <div class="item-content">
                      <div class="item-inner">
                        <div class="item-title">Message/Queries</div>
                        <div class="item-input item-input-field">
                          <textarea class="resizable"></textarea>
                        </div>
                      </div>
                    </div>
                  </li>
                </ul>
              </div>
              <div class="content-block"> <a href="/f7-theme/max_solaris/home.html" class="button button-fill ">Get in touch</a> </div>
              <hr>
              <div class="center content-block ">
                <div class=""><img src="/f7-theme/max_solaris/img/phone.png" alt="">
                </div>
                <h2 class=""> 000 000 000 </h2>
                <p class=""> Call Us </p>
              </div>
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
            <div class="buttonbar row no-gutter">
              <a href="/f7-theme/max_solaris/contactus.html" class=" button button-fill col-100 close-panel">Locate Us</a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Main Views -->
    <f7-views>
      <f7-view id="main-view" :dynamic-navbar="false" main>
        <!-- Navbar -->
        <!-- <f7-navbar>
          <f7-nav-left>
            <f7-link icon="icon-bars" open-panel="left"></f7-link>
          </f7-nav-left>
          <f7-nav-center sliding>Framework7</f7-nav-center>
          <f7-nav-right>
            <f7-link icon="icon-bars" open-panel="right"></f7-link>
          </f7-nav-right>
        </f7-navbar> -->
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

export default {
  components: { 'my-main': main },
  computed: {
    ...mapState({
      isLoading: state => state.common.isLoading
    })
  },
  mounted () {
    this.$store.commit(CHANGE_LOADING_STATUS, {isLoading: true})
    setTimeout(function () {
      this.$store.commit(CHANGE_LOADING_STATUS, {isLoading: false})
    }.bind(this), 5000)
  }
}
</script>
