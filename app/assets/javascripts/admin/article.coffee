$(document).ready ()->
  pages = $('body.admin-articles')
  if pages.length > 0
    image_container = pages.find('image-select')
    if image_container.length > 0
      image = new Vue
        el: image_container[0]

    # 时间选择控件绑定
    $('.date_form_datetime').datetimepicker
      format: 'yyyy-mm-dd'
      autoclose: true
      startView: 4
      minView: 2
