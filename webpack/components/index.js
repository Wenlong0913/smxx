var Vue = require("vue");
Vue.components = {};
Vue.components.Hello = Vue.component('hello', require("./hello"))

Vue.components.ImageUpload = Vue.component('image-upload', require('./image_upload'));
Vue.components.ImageAlbum = Vue.component('image-album', require('./image_album'));
Vue.components.Modal = Vue.component('modal', require('./modal'));
Vue.components.ImageSelect = Vue.component('image-select', require('./image_select'));
