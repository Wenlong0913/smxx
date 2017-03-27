export default [
  {
    path: '/about/',
    component: require('./pages/about.vue')
  },
  {
    path: '/form/',
    component: require('./pages/form.vue')
  },
  {
    path: '/dynamic-route/blog/:blogId/post/:postId/',
    component: require('./pages/dynamic-route.vue')
  },
  {
    path: '/vue-cordova/',
    component: require('./pages/vue-cordova.vue')
  },
  {
    path: '/feature/',
    component: require('./pages/feature.vue')
  }
]
