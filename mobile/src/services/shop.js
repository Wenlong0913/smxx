import http from 'services/http'

function list () {
  return new Promise(function (resolve, reject) {
    http.get('/shops')
      .then(function (response) {
        resolve(response.data)
      }).catch(function (error) {
        reject(error)
      })
  })
}

function get (id) {
  return new Promise(function (resolve, reject) {
    http.get('/shops/' + id)
      .then(function (response) {
        resolve(response)
      }).catch(function (error) {
        reject(error)
      })
  })
}

let Shop = {
  list,
  get
}

export default Shop
