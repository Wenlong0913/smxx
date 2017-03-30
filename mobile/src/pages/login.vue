<template>
<f7-page name="login">
  <f7-navbar back-link="Back" class="header">
    <div class="navbar-inner">
      <div class="left sliding">
        <a href="/" class="link icon-only"><i class="fa fa-chevron-left"></i></a>
      </div>
    </div>
  </f7-navbar>

  <div class="page-content logins hide-bars-on-scroll">
    <div class="loginsimag row">
      <img  src="./../assets/img/icon.png" alt="">
    </div>
    <div class="clear"></div>
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
    <div class="buttonbar row no-gutter">
      <button @click="submit" class="button-fill button col-100">提 交</button>
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
        _this.$router.load({ url: '/staffs' })
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
