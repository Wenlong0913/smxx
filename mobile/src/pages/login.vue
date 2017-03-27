<template>
  <f7-page>
    <f7-navbar title="Log me in" back-link="Back" sliding></f7-navbar>
    <h1>Login</h1>

    <f7-list>
      <f7-list-item>
        {{user.mobile_phone}}
      </f7-list-item>
      <f7-list-item>
        {{user.access_token}}
      </f7-list-item>
      <f7-list-item>
        Username: <input type="text" name="" v-model="form.username">
      </f7-list-item>
      <f7-list-item>
        password: <input type="text" name="" v-model="form.password">
      </f7-list-item>
      <f7-list-item>
        <button @click="submit">Login</button>
        <button @click="get_my_info">Get my info</button>
      </f7-list-item>
    </f7-list>
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
        _this.$router.load({ url: '/about' })
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
