export default [
  {
    path: '/login/',
    component: require('./pages/login.vue')
  },
  {
    path: '/sign-in/',
    component: require('./pages/sign-in.vue')
  },
  {
    path: '/shops/',
    component: require('./pages/shops.vue')
  },
  {
    path: '/shops/:id/',
    component: require('./pages/shop_detail.vue')
  },
  {
    path: '/sites/',
    component: require('./pages/sites.vue')
  },
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
