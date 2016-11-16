# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$.onReady ->
  body = $('body.sessions.new')
  if body.length > 0
    setinterval_1 = null
    body.find('#mobile_login_modal').on 'show.bs.modal', ->
      $(this).find('.modal-body .title_error').text('')
      $(this).find('.modal-body .get_code')
        .text('获取验证码')
          .removeAttr('disabled')
      if setinterval_1
        clearInterval setinterval_1
    body.find('#mobile_login_modal .modal-body .get_code').on 'click', ->
      this_dom = $(this)
      if !this_dom.prop('disabled')
        this_dom.parents('.form-group').next().text('')
        mobile = this_dom.parents('.modal-body').find("input[name='user[mobile]']").val()
        url = this_dom.data('url')
        time_second = 60
        this_dom.attr('disabled','disabled')
        setinterval_1 = setInterval ->
          if time_second > 0
            this_dom.text(time_second-- +' S')
          else
            this_dom.text('获取验证码')
            clearInterval setinterval_1
            this_dom.removeAttr('disabled')
        ,1000

        $.ajax
          url: url
          type: 'post'
          data:
            mobile: mobile
          error: ->
            this_dom.removeAttr('disabled')
            clearInterval setinterval_1
            this_dom.text('获取验证码')
            this_dom.parents('.form-group').next().text('发送失败！')
          success: ->
            console.log 'ok'
