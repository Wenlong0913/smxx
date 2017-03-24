// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import store from './store'
import Routes from './routes'
import CordovaHelper from './utils/CordovaHelper'

require('./framework7')

/* setup cordova */
CordovaHelper.setup()
/* fast click */
const FastClick = require('fastclick')
FastClick.attach(document.body)

/* eslint-disable no-new */
new Vue({
  el: '#app',
  store,
  template: '<App/>',
  framework7: {
    root: '#app',
    /* Uncomment to enable Material theme: */
    // material: true,
    routes: Routes
  },
  components: { App }
})
