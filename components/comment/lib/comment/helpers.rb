module Comment
  module Helpers
    def render_comments(resource, comment_path:, reply_path:)
      cell(Comment::EntryCell, resource, comment_path: comment_path, reply_path: reply_path).()
    end
  end
end