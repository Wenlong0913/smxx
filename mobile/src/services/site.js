import http from 'services/http'

function list () {
  return new Promise(function (resolve, reject) {
    http.get('/sites')
      .then(function (response) {
        resolve(response.data)
      }).catch(function (error) {
        reject(error)
      })
  })
}

function get (id) {
  return new Promise(function (resolve, reject) {
    http.get('/sites/' + id)
      .then(function (response) {
        resolve(response)
      }).catch(function (error) {
        reject(error)
      })
  })
}

let Site = {
  list,
  get
}

export default Site
