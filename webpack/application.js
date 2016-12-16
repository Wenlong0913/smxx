console.log("Hello world!"); 
var Vue = require('vue');
var VueResource = require('vue-resource');
Vue.use(VueResource);
Vue.http.interceptors.push((request, next)  => {
 var meta = document.querySelector('[name="csrf-token"]'),
     content = meta && meta.getAttribute('content')
 if(content){
   Vue.http.headers.common['X-CSRF-Token'] = content;
 }
 // continue to next interceptor
 next((response) => {
 });
});
Vue.component('image-upload', require('./components/image_upload'));
Vue.component('image-album', require('./components/image_album'));
Vue.component('modal', require('./components/modal'));
Vue.component('image-select', require('./components/image_select'));