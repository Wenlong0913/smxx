import http from 'services/http'

function input (params) {
  return new Promise(function (resolve, reject) {
    http.post('/shopping_carts', params)
    .then(function (response) {
      resolve(response.data)
    }).catch(function (error) {
      reject(error)
    })
  })
}

function get () {
  return new Promise(function (resolve, reject) {
    http.get('/shopping_carts')
    .then(function (response) {
      resolve(response.data)
    }).catch(function (error) {
      reject(error)
    })
  })
}

function del (params) {
  return new Promise(function (resolve, reject) {
    http.delete('/shopping_carts', params)
    .then(function (response) {
      resolve(response.data)
    }).catch(function (error) {
      reject(error)
    })
  })
}

let ShoppingCart = {
  input,
  get,
  del
}

export default ShoppingCart
