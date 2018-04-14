$(document).ready ->
  bodyNew = $('body.agent-courses.new')
  # new  
  console.log bodyNew
    bodyNew.find('.change-step').on 'click', ->
      $(window).scrollTop(0)
      change_step_class = $(this).attr("href").replace("#", "")
      bodyNew.find('.checkout-header .step').removeClass('active')
      bodyNew.find("."+change_step_class).addClass('active')
    bodyNew.find('form#new_course').on 'ajax:error', (event,request)->
      $.gritter.add({title: '提示', text: '商品发布失败!'})
    bodyNew.find('form#new_course').on 'ajax:success', (event,request)->
      $(window).scrollTop(0)
      bodyNew.find('.checkout-header .step').removeClass('active')
      bodyNew.find("[role='tabpanel']").removeClass('active in fade')
      if request.errors
        $.gritter.add({title: '提示', text: request.errors})
        bodyNew.find('.basicInformation.step').addClass('active')
        bodyNew.find('#basicInformation').addClass('active')
      else
        bodyNew.find('#last .new-product').attr("href", request.url)
        bodyNew.find('.last.step').addClass('active')
        bodyNew.find('#last').addClass('active in')

 