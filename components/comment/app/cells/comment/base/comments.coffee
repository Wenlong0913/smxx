$(document).ready ->

  processCommentBlock = ()->
    blockEle  = $(this)
    url       = blockEle.data('url')
    imagePath = blockEle.data('image')
    filePath = blockEle.data('file')
    blockEle.attr 'uuid', "#{new Date().getTime()}-#{Math.random()}"

    postComment = (target) ->
      if target == 'comment'
        this.replyTo = null
        content_info = this.content
      else if target == 'reply'
        content_info = this.replyContent
      self = this
      self.posting = true
      dataAll =
        'comment[content]': content_info
        'comment[parent_id]': (this.replyTo and this.replyTo.id)
        'comment[features]': self.features
      $.post
        url: url
        data: dataAll
        success: (data)->
          self.posting = false
          self.replying = false
          self.comments.unshift data.comments
          self.content = ''
          for k, v of self.features
            self.features[k] = null
        error: (error)->
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
    upFiles = ()->
      self = this
      $.post
        url: '/'
        data: {}
        success: (data)->
          self.files = data
        error: (data)->
          console.log data
          alert '文件上传失败'
    upImages = ()->
      # self = this
      # formData = new FormData($("#upImages input[name='image']")[0].files[0])
      # $.post
      #   url: imagePath
      #   data: formData
      #   contentType: false
      #   processData: false
      #   success: (data)->
      #     self.files = data
      #   error: (data)->
      #     console.log data
      #     alert '文件上传失败'
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
        comment:
          files: []
          images: []
          offer: '999'
        inputFileValue: ''
        inputImageValue: ''
      methods:
        postComment: postComment
        replyModel: replyModel
        loadComments: loadComments
        upFiles: upFiles
        upImages: upImages
        onChangeFile: (e)->
          console.log e.target.files
          console.log imagePath
          $.post
            url: '/'
            data: {}
            success: (data)->
              self.files = data
            error: (data)->
              console.log data
              alert '文件上传失败'
        onChangeImage: (e)->
          upImages()
          # files = e.target.files
          # console.log files[0].
          # return alert '浏览器不支持' unless window.FormData
          # formData = new FormData()
          # # formData.append(files[0])
          # console.log formData
          # $.ajax
          #   url: imagePath
          #   type: 'post'
          #   processData: false
          #   contentType: false
          #   data: formData
          #   dataType: 'json'
          #   success: (data)->
          #     self.files = data
          #   error: (data)->
          #     console.log data
          #     alert '图片上传失败'

    loadComments()


  # apply to all comment-block
  $('[rel="comment-block"]').each processCommentBlock
