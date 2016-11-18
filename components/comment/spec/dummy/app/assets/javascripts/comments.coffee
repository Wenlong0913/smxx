$(document).ready ->
  $("form[data-rel='comment-form']").each ->
    $(this).on("ajax:success", (e, data, status, xhr) ->
      $(this).parent("[rel='comment-block']").children("[rel='comment-list']").append("<li rel='comment-entry' data-id=" + data.id + "><i>#"+data.id+"</i>"+data.content+"</li>")
    ).on "ajax:error", (e, xhr, status, error) ->
      alert('评论发送失败')
