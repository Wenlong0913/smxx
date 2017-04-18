import http from 'services/http'

function list () {
  return new Promise(function (resolve, reject) {
    http.get('/product_catalogs')
      .then(function (response) {
        resolve(response.data)
      }).catch(function (error) {
        reject(error)
      })
  })
}

function get (id) {
  return new Promise(function (resolve, reject) {
    http.get('/product_catalogs/' + id)
      .then(function (response) {
        resolve(response)
      }).catch(function (error) {
        reject(error)
      })
  })
}

let ProductCatalog = {
  list,
  get
}

export default ProductCatalog
