$(document).ready ->
  bodyIndex = $('.agent-orders.index')
  if bodyIndex.length > 0
    confirmDelivered = $('.order-status')
    confirmDelivered.each ->
      $(this).on 'ajax:success', (event, request) ->
        if request.status == 'ok'
          $.gritter.add({title: '提示', text: "您已确认收货"})
          $(this).parent('.order-status-display').html("<span class='label label-info' style='padding: 8px 10px'>已收货</span>")
        else
          $.gritter.add({title: '错误', text: request.message})
      $(this).on 'ajax:error', (event, request) ->
        $.gritter.add({title: '错误', text: '网络错误'})
  bodyShow = $('.agent-orders.show')
  if bodyShow.length > 0
    orderDelivery = $('#orderDelivery')
    if orderDelivery.length > 0
      orderDelivery.each ->
        $(this).on 'ajax:success', (event, request) ->
          if request.status == 'ok'
            bodyShow.find('.display_order_delivery').text(request.message)
            orderDelivery.modal('hide')
            $.gritter.add({title: '提示', text: '物流信息保存成功'})
          else
            bodyShow.find('.error_message').text(request.message)
        $(this).on 'ajax:error', (event, request) ->
          $.gritter.add({title: '错误', text: '网络错误'})
