import http from 'services/http'

function all () {
  return new Promise(function (resolve, reject) {
    http.get('/rooms')
    .then(function (response) {
      resolve(response)
    }).catch(function (error) {
      reject(error)
    })
  })
}

let Room = {
  all
}

export default Room
