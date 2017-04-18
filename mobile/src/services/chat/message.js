import http from 'services/http'

function all (options) {
  return new Promise(function (resolve, reject) {
    http.get('/messages', {params: {room_id: options.room_id, _page: options.current_page, _per_page: options.pageSize}})
    .then(function (response) {
      resolve(response)
    }).catch(function (error) {
      reject(error)
    })
  })
}

let Message = {
  all
}

export default Message
