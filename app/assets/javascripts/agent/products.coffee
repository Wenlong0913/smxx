$(document).ready ->
  body = $('body.agent-products.new')
  if body.length > 0
    body.find('.checkout-header .step').on 'click', ->
      body.find('.checkout-header .step').removeClass('active')
      $(this).addClass('active')

    new Vue
      el: '.tab-content'
