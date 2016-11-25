$(document).ready ->

  processCommentBlock = ()->
    blockEle  = $(this)
    url       = blockEle.data('url')
    blockEle.attr 'uuid', "#{new Date().getTime()}-#{Math.random()}"

    postComment = (target) ->
      if target == 'comment'
        this.replyTo.id = null
      self = this
      self.posting = true
      $.post url, 'comment[content]': this.content, 'comment[parent_id]': this.replyTo.id
        .success (data)->
          self.posting = false
          self.replying = false
          self.comments.unshift data
          self.content = ''
        .error (error)->
          self.posting = false
          alert error

    loadComments = ->
      $.get url
      .success (data)->
        app._data.loading = false
        app._data.comments = data
      .error (error)->
        app._data.error = true

    replyModel = (comment_target)->
      this.replyTo = comment_target
      this.replying = true

    app = new Vue
      el: "[rel='comment-block'][uuid='#{blockEle.attr('uuid')}']"
      data:
        comments: []
        error: false
        posting: false
        loading: true
        replying: false
        replyTo:
          id: null
        content: ''
        replyContent: ''
        display: 'block'
      methods:
        postComment: postComment
        replyModel: replyModel

    loadComments()
    
    
  # apply to all comment-block
  $('[rel="comment-block"]').each processCommentBlock


