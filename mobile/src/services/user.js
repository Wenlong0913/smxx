import http from 'services/http'
import store from 'store'
import {SET_USER_TOKEN, SET_USER} from 'store/modules/common'

function login (params) {
  return new Promise(function (resolve, reject) {
    http.post('/users/auth', params)
    .then(function (response) {
      if (response.data['error']) {
        reject(response.data['error'])
      } else {
        store.commit(SET_USER, response.data)
        store.commit(SET_USER_TOKEN, response.data.access_token)
        resolve(response.data)
      }
    }).catch(function (error) {
      console.log('error', error)
    })
  })
}

function me () {
  return new Promise(function (resolve, reject) {
    http.get('/users/me')
      .then(function (response) {
        resolve(response.data)
      }).catch(function (error) {
        reject(error)
      })
  })
}

let User = {
  login,
  me
}

export default User
