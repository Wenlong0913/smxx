<template>
<f7-page name="login">
  <f7-navbar back-link="Back" class="header">
    <div class="navbar-inner">
      <div class="left sliding">
        <a href="/" class="link icon-only back"><i class="fa fa-chevron-left"></i></a>
      </div>
    </div>
  </f7-navbar>

  <div class="page-content logins hide-bars-on-scroll">
    <div class="loginsimag row">
      <img  src="./../assets/img/icon.png" alt="">
    </div>
    <div class="clear"></div>

    <div class="toolbar tabbar" style="top: 0;">
      <div class="toolbar-inner">
        <a href="#tab1" class="tab-link active button">登 录</a>
        <a href="#tab2" class="tab-link button">注 册</a>
      </div>
    </div>

    <div class="tabs">
      <div id="tab1" class="tab active">
        <f7-list form class="list-block">
          <ul>
            <li class="item-content">
              <div class="item-inner">
                <div class="item-title label">用户名/手机号/邮箱</div>
                <div class="item-input">
                  <f7-input class="style login3" type="text" name="email" placeholder="用户名/邮箱/密码" v-model="form.username" />
                </div>
              </div>
            </li>
            <li class="item-content">
              <div class="item-inner">
                <div class="item-title label">密码</div>
                <div class="item-input">
                  <f7-input class="style login3" type="password" name="password" placeholder="" v-model="form.password" />
                </div>
              </div>
            </li>
          </ul>
        </f7-list>
        <a href="#tab2" class="tab-link active button">还没有账户？去注册一个吧！</a>
        <div class="buttonbar row no-gutter">
          <button @click="submit" class="button-fill button col-100">登 录</button>
        </div>
      </div>
      <div id="tab2" class="tab">
        <f7-list form class="list-block">
          <ul>
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title  label">姓 名</div>
                  <div class="item-input">
                    <input type="text" placeholder="请输入您的姓名"/>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title label ">手 机</div>
                  <div class="item-input">
                    <input type="tel" placeholder="请输入您的手机"/>
                  </div>
                </div>
              </div>
            </li>
            <li>
              <div class="item-content">
                <div class="item-inner">
                  <div class="item-title  label">密 码</div>
                  <div class="item-input">
                    <input type="password" placeholder=""/>
                  </div>
                </div>
              </div>
            </li>
          </ul>
        </f7-list>
        <a href="#tab1" class="tab-link active button">已有账户？去登录吧！</a>
        <div class="buttonbar row no-gutter">
          <button @click="submit" class="button-fill button col-100">提 交</button>
        </div>
      </div>
    </div>
  </div>
</f7-page>
</template>

<script>
import User from 'services/user'
export default {
  data () {
    return {
      form: {
        username: 'xiaohui',
        password: 'abcd1234'
      },
      access_token: '',
      user: {}
    }
  },
  methods: {
    submit () {
      var _this = this
      User.login(this.form).then(function (data) {
        console.log('login success', data)
        _this.$router.load({ url: '/home' })
      }).catch(function (error) {
        window.alert(error)
      })
    },
    get_my_info () {
      User.me().then(function (data) {
        console.log('my info', data)
      })
    }
  }
}
</script>
