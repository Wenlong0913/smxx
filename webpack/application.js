console.log("Hello world!"); 
var Vue = require('vue');
var VueResource = require('vue-resource');
Vue.use(VueResource);
Vue.component('image-upload', require('./components/image_upload'))
Vue.component('image-album', require('./components/image_album'))