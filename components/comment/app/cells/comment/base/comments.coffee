$(document).ready ->

  processCommentBlock = ()->
    blockEle  = $(this)
    url       = blockEle.data('url')
    reply_url = blockEle.data('reply-url')
    blockEle.attr 'uuid', "#{new Date().getTime()}-#{Math.random()}"

    postComment = ->
      self = this
      self.posting = true
      $.post url, 'comment[content]': this.content
        .success (data)->
          self.posting = false
          self.comments.push data
          self.content = ''
        .error (error)->
          self.posting = false
          alert error
      loadComments()

    loadComments = ->
      $.get url
      .success (data)->
        app._data.loading = false
        app._data.comments = data
      .error (error)->
        app._data.error = true

    postReply = ->
      $.post reply_url, 'reply[content]': this.replyContent, 'reply[comment_id]': this.replyTo.id
        .success (data)->
          this.replying = false
        .error (error)->
          alert error
      loadComments()

    replyModel = (comment_target, reply_target)->
      this.replyTo = comment_target
      this.replying = true
      if reply_target is null
        this.replyContent = ''
      else
        this.replyContent = '@' + reply_target.id + ':'

    app = new Vue
      el: "[rel='comment-block'][uuid='#{blockEle.attr('uuid')}']"
      data:
        comments: []
        error: false
        posting: false
        loading: true
        replying: false
        replyTo: null
        content: ''
        replyContent: ''
        display: 'block'
      methods:
        postComment: postComment
        replyModel: replyModel
        postReply: postReply

    loadComments()
    
    
  # apply to all comment-block
  $('[rel="comment-block"]').each processCommentBlock


