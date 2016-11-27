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
          self.comments.unshift data.comment_data
          self.content = ''
        .error (error)->
          self.posting = false
          alert error

    loadComments = ->
      $.get url, 'page': app._data.currentPage
      .success (data)->
        app._data.loading = false
        app._data.comments = data.comment_data
        app._data.allPages = data.page_data.total_pages
        app._data.currentPage = data.page_data.current_page
      .error (error)->
        app._data.error = true

    replyModel = (comment_target)->
      this.replyTo = comment_target
      this.replying = true

    showFirst = ->
      if this.currentPage == 1
        return false
      return true
    
    showLast = ->
      if this.currentPage == this.allPages
        return false
      return true

    pageIndexs = ->
      left = 1
      right = this.allPages
      display_pages = []
      if this.allPages >= 11
        if this.currentPage > 5 and this.currentPage < this.allPages - 4
          left = this.currentPage - 5
          right = this.currentPage + 4
        else
          if this.currentPage <= 5
            left = 1
            right = 10
          else
            left = this.allPages - 9
            right = this.allPages
      while left <= right
        display_pages.push left
        left++
      return display_pages

    btnClick = (page)->
      if page != this.currentPage
        this.currentPage = page
      loadComments()

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
        allPages: null
        currentPage: 1 
      methods:
        postComment: postComment
        replyModel: replyModel
        btnClick: btnClick
        loadComments: loadComments
      computed:
        showFirst: showFirst
        showLast: showLast
        pageIndexs: pageIndexs

    loadComments()
    
    
  # apply to all comment-block
  $('[rel="comment-block"]').each processCommentBlock


