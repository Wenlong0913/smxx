<template>
  <!-- App -->
  <div id="app">


    <!-- Main Views -->
    <f7-views>
      <f7-view id="main-view" navbar-through :dynamic-navbar="true" main>
        <!-- Navbar -->
        <f7-navbar>
          <f7-nav-left>
            <f7-link icon="icon-bars" open-panel="left"></f7-link>
          </f7-nav-left>
          <f7-nav-center sliding>Framework7</f7-nav-center>
          <f7-nav-right>
            <f7-link icon="icon-bars" open-panel="right"></f7-link>
          </f7-nav-right>
        </f7-navbar>
        <!-- Pages -->
        <f7-pages>
          <f7-page>
            <div class="page-content landingpage gradient">
              <div class="logo main col12">
                <img src="./assets/img/icon.png" alt=""> </div>
              <div class="introtext">
                <h1> 美克美<br>定制私人美容</h1>
                <p>专业优质的社区美容服务</p>
              </div>
              <div class="buttonbar  no-gutter">
                <a href="/login" class="button-fill button color-indigo col">用户登录</a>
                <a href="/sign-in" class="button-fill button color-indigo col">用户登录</a>
                <a href="/shops" class="color2 button col">Shops美容院</a>
                <a href="/sites" class="color2 button col">Sites美容师</a>
                <a href="/f7-theme/max_solaris/register.html" class="color2 button col">新人注册</a>
                <a href="/beautician" class="button-fill button color-indigo col">美容师主页</a>
              </div>

            </div>
          </f7-page>
        </f7-pages>

      </f7-view>
    </f7-views>

    <!-- Popup -->
    <f7-popup id="popup">
      <f7-view navbar-fixed>
        <f7-pages>
          <f7-page>
            <f7-navbar title="Popup">
              <f7-nav-right>
                <f7-link close-popup class="close-popup">关闭</f7-link>
              </f7-nav-right>
            </f7-navbar>
            <f7-block>Close无效，需要手动添加一个class="close-popup", consectetur adipisicing elit. Neque, architecto. Cupiditate laudantium rem nesciunt numquam, ipsam. Voluptates omnis, a inventore atque ratione aliquam. Omnis iusto nemo quos ullam obcaecati, quod.
              <f7-link @click="$router.back()">Go back via Router API</f7-link>
            </f7-block>
          </f7-page>
        </f7-pages>
      </f7-view>
    </f7-popup>

    <!-- Login Screen -->
    <f7-login-screen id="login-screen">
      <f7-view>
        <f7-pages>
          <f7-page login-screen>
            <f7-login-screen-title>Login</f7-login-screen-title>
            <f7-list form>
              <f7-list-item>
                <f7-label>Username</f7-label>
                <f7-input name="username" placeholder="Username" type="text"></f7-input>
              </f7-list-item>
              <f7-list-item>
                <f7-label>Password</f7-label>
                <f7-input name="password" type="password" placeholder="Password"></f7-input>
              </f7-list-item>
            </f7-list>
            <f7-list>
              <f7-list-button title="Sign In" close-login-screen></f7-list-button>
              <f7-list-label>
                <p>Click Sign In to close Login Screen</p>
              </f7-list-label>
            </f7-list>
          </f7-page>
        </f7-pages>
      </f7-view>
    </f7-login-screen>

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
