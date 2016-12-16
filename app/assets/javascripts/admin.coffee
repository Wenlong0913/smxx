#= require admin/sessions
#= require tracker
# can't require tree
# require_tree .

$(document).ready ->
  new Vue
    el: 'vue-app'
    data: ()->
      return {
        loading: false
      }
