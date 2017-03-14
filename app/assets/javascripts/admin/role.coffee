$(document).ready ->
  blockEle  = $('[rel="permission-block"]')
  url       = blockEle.data('url')
  permissions = blockEle.data('permission')
  
  loadPermissions = ->
    console.log(this)
    # app._data.allPermission = permissions

  app = new Vue
    el: "[rel='permission-block']"
    data:
      allPermission: []
    mount:
      # loadPermissions()
      this.allPermission =  $('[rel="permission-block"]').data('permission')
      # this.allPermission = permissions




  # $('[rel="permission-block"]').each processPermissionBlock