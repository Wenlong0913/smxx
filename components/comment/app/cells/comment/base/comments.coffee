$(document).ready ->

  processCommentBlock = ()->
    blockEle  = $(this)
    url       = blockEle.data('url')
    blockEle.attr 'uuid', "#{new Date().getTime()}-#{Math.random()}"

    postComment = (target) ->
      if target == 'comment'
        this.replyTo = null
        content_info = this.content
      else if target == 'reply'
        content_info = this.replyContent
      self = this
      self.posting = true
      $.post url, 'comment[content]': content_info, 'comment[parent_id]': (this.replyTo and this.replyTo.id)
        .success (data)->
          self.posting = false
          self.replying = false
          self.comments.unshift data.comments
          self.content = ''
        .error (error)->
          self.posting = false
          alert error

    loadComments = ->
      $.get url, 'page': app._data.currentPage
      .success (data)->
        app._data.loading = false
        app._data.comments = data.comments
        app._data.pageCount = data.total_pages
        app._data.currentPage = data.current_page
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
        replyTo: null
        content: ''
        replyContent: ''
        pageCount: null
        currentPage: 1 
      methods:
        postComment: postComment
        replyModel: replyModel
        loadComments: loadComments

    loadComments()
    
    
  # apply to all comment-block
  $('[rel="comment-block"]').each processCommentBlock


