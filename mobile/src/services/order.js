import http from 'services/http'

function post (params) {
  return new Promise(function (resolve, reject) {
    http.post('/orders', params)
    .then(function (response) {
      resolve(response.data)
    }).catch(function (error) {
      reject(error)
    })
  })
}

function get (id) {
  return new Promise(function (resolve, reject) {
    http.get('/orders/' + id)
    .then(function (response) {
      resolve(response.data)
    }).catch(function (error) {
      reject(error)
    })
  })
}

let Order = {
  post,
  get
}

export default Order
