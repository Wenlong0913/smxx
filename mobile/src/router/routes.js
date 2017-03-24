import Home from 'views/Home'
import NotFound from 'views/NotFound'
import Login from 'views/Login'

export default [
  { path: '/index.html', name: 'root', component: Home, alias: '/' },
  { path: '/login', name: 'login', component: Login },
  { path: '*', component: NotFound },
  {
    path: '/about/',
    component: require('./../views/about.vue')
  },
  {
    path: '/form/',
    component: require('./../views/form.vue')
  },
  {
    path: '/dynamic-route/blog/:blogId/post/:postId/',
    component: require('./../views/dynamic-route.vue')
  }
]
