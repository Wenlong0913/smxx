#= require admin/sessions
#= require tracker
# can't require tree
# require_tree .

$(document).ready ->
  $('[rel=vue]').each (index, ele)->
    new Vue
      el: ele
  App.init()
