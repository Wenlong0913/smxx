export default [
  {
    path: '/login/',
    component: require('./pages/login.vue')
  },
  {
    path: '/home/',
    component: require('./pages/home.vue')
  },
  {
    path: '/staffs/',
    component: require('./pages/staffs.vue')
  },
  {
    path: '/staffs/:id/',
    component: require('./pages/staff_detail.vue')
  },
  {
    path: '/sites/',
    component: require('./pages/sites.vue')
  },
  {
    path: '/sites/:id/',
    component: require('./pages/site_detail.vue')
  },
  {
    path: '/product_catalogs/:id/',
    component: require('./pages/product_catalogs.vue')
  },
  {
    path: '/about/',
    component: require('./pages/about.vue')
  },
  {
    path: '/contact/',
    component: require('./pages/contact.vue')
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
