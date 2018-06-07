$(document).ready ->
  forms = $('form#frontend-order-new')
  if forms.length > 0
    # 附加属性添加
    attrListDom = forms.find("div[rel='signup_members_vue']")
    maximumForOneOrder = attrListDom.data("maximum-for-one-order")
    attrList = new Vue
      el: attrListDom[0]
      data:
        defaultvalues: {}
        defaultkeys: {}
        # members: [{key: (new Date()).getTime()}]
        orderNumber: 1
        tempMembers: [{key: (new Date()).getTime()}]
      methods:
        removeMembers: (index)->
          if (this.tempMembers.length > 1)
            this.tempMembers.splice(index, 1)
            this.orderNumber = this.orderNumber - 1
          else
            alert('至少填写一个名额')
      computed:
        members: ->
          temp = this.tempMembers
          if temp.length < this.orderNumber
            for i in [(temp.length+1)..this.orderNumber]
              temp.push({key: (new Date()).getTime() + i})
          else
            temp = temp.splice(0, this.orderNumber)
          this.tempMembers = temp
          return temp
    # defaultkeys = bodyEdit.find("div[rel='attr_list_vue']").data('keys')
    # defaultvalues = bodyEdit.find("div[rel='attr_list_vue']").data('values')
    # attrList.lists = []
    # max = 0
    # for name, v of defaultkeys
    #   if parseInt(name) > 0
    #     max = parseInt(name) if max < parseInt(name)
    #     attrList.lists.push {key: v, name: parseInt(name), value: defaultvalues[name]}
    #     attrList.count = max+1
    # attrList.lists.push {key: ' ', name: attrList.count, value: ' '}