import http from 'services/http'

function list () {
  return new Promise(function (resolve, reject) {
    http.get('/products')
      .then(function (response) {
        resolve(response.data)
      }).catch(function (error) {
        reject(error)
      })
  })
}

function get (id) {
  return new Promise(function (resolve, reject) {
    http.get('/products/' + id)
    .then(function (response) {
      resolve(response)
    }).catch(function (error) {
      reject(error)
    })
  })
}

let Product = {
  list,
  get
}

export default Product
