#= require 'action_cable'
subscriber = null
navMessagesVue = null
tableMessagesVue = null
onReceivedMessage = (data)->
  if data.type == 'notification-message' || true
    data = JSON.parse data.message
    localMessages = JSON.parse(sessionStorage.getItem('messages') || null) || []
    localMessages.splice 0, 0, data
    navMessagesVue._data.messages = localMessages
    tableMessagesVue.addItem(data) if tableMessagesVue
    sessionStorage.setItem('messages', JSON.stringify(localMessages))
onConnected = ->
  console.log('connected')
  sessionStorage.removeItem('messages')
  subscriber.perform('push_agent_message', {})
onDisconnected = ->
  console.log('disconnected')
connect = (credential, events = {}) ->
  channel = 'UserChannel'
  defaultEvents =
    connected: ->
      console.log('debug', 'my cable connected')
    disconnected: ->
      console.log('debug', 'my cable disconnected')
    rejected: ->
      console.log('debug', 'my cable rejected')
    received: (payload) ->
      console.log('debug', 'my cable received: ', payload)
  cable = window.ActionCable.createConsumer('/cable?credential=' + credential)
  cable.subscriptions.create({channel}, Object.assign({}, defaultEvents, events))
removeItem = (item, index)->
  navMessagesVue._data.messages.splice(index, 1)
  tableMessagesVue._data.messages.splice(index, 1) if tableMessagesVue
  sessionStorage.setItem('messages', JSON.stringify(navMessagesVue._data.messages))
  $.ajax
    url: '/agent/messages/'+item.id
    type: 'PATCH'
    success: (data)->
      if data.status == 'ok'
        console.log 'ok'
      else
        $.gritter.add({type: 'error', title: '错误', text: "删除失败!"})
        location.reload(true)
    error: (data)->
      $.gritter.add({type: 'error', title: '错误', text: "删除失败!"})
      location.reload(true)
redirectTo = (item, index)->
  removeItem(item, index)
  switch item.target_type
    when 'Order'
      window.location.href = "/agent/orders/"+item.target_id

$ ->
  # 连接
  if !subscriber
    subscriber = connect($('body').data('token'), {
      disconnected: onDisconnected,
      connected: onConnected,
      received: onReceivedMessage
    })
  # head nav message vue
  navMessagesVue = new Vue
    name: 'pushMessages'
    el: '.nav-head-push-messages'
    data:
      messages: []
    methods:
      load: ->
        this.messages = JSON.parse(sessionStorage.getItem('messages')) || []
      removeItem: (item, index)->
        removeItem(item, index)
      redirectTo: (item, index) ->
        redirectTo(item, index)
    mounted: ->
      this.load()
  # table list message vue
  pages = $('.agent-messages.index')
  if pages.length > 0
    container = pages.find('.table-push-messages')
    tableMessagesVue = new Vue
      name: 'TableMessages'
      el: container[0]
      data:
        messages: []
      methods:
        load: ->
          for x in $(this.$el).data('messages')
            this.addItem(x)
        removeItem: (item, index)->
          removeItem(item, index)
        redirectTo: (item, index) ->
          redirectTo(item, index)
        addItem: (item) ->
          hasItem = true
          for x in this.messages
            hasItem = false if x.id == item.id
          this.messages.splice(0, 0, item) if hasItem
      mounted: ->
        this.load()
