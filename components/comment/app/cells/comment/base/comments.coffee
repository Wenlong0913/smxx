$(document).ready ->

  processCommentBlock = ()->
    blockEle  = $(this)
    url       = blockEle.data('url')
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

    loadComments = ->
      $.get url
      .success (data)->
        app._data.loading = false
        app._data.comments = data
      .error (error)->
        app._data.error = true

    app = new Vue
      el: "[rel='comment-block'][uuid='#{blockEle.attr('uuid')}']"
      data:
        comments: []
        error: false
        posting: false
        loading: true
        content: ''
      methods:
        postComment: postComment

    loadComments()
    
    
  # apply to all comment-block
  $('[rel="comment-block"]').each processCommentBlock


