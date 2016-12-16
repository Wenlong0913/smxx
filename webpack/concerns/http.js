var Vue = require('vue')
Vue.use(require('vue-resource'))
// Vue.http.options.root = '/api';
Vue.http.interceptors.push(function(){
  return {
    request: function (request) {
      var meta = document.querySelector('[name="csrf-token"]'),
        content = meta && meta.getAttribute('content')
      if(content){
        Vue.http.headers.common['X-CSRF-Token'] = content;
      }
      return request;
    },
    response: function (response) {
      return response;
    }
  }
});
