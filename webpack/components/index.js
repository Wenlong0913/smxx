var Vue = require("vue");
Vue.components = {};
Vue.components.Hello = Vue.component('hello', require("./hello"))
Vue.components.Loading = Vue.component('loading', require("./loading"))
