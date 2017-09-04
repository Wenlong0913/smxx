$(document).ready ->
  forms = $('form#new_order')
  if forms.length > 0
    # 附加属性添加
    attrListDom = forms.find("div[rel='signup_members_vue']")
    attrList = new Vue
      el: attrListDom[0]
      data:
        defaultvalues: {}
        defaultkeys: {}
        members: [{key: (new Date()).getTime()}]
      methods:
        addMembers: ->
          console.log('add members')
          this.members.push({key: (new Date()).getTime()})
        removeMembers: (index)->
          this.members.splice(index, 1)
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