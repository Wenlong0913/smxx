var Vue = require('vue')
Vue.use(require('vue-resource'))
// Vue.http.options.root = '/api';
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
