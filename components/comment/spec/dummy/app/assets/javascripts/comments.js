$(document).ready(function() {
  $("[data-rel='comment-form']").each(function(){
    $(this).on("ajax:success", function(e, data, status, xhr) {
      $(this).parent('.comment-data').children(".comment-list").append("<p><i>#"+data.comment.id+"</i>"+data.comment.content+"</p>")
    }).on("ajax:error", function(e, xhr, status, error) {
      $("#new_article").append("<p>ERROR</p>");
    });
  })
});
