module Comment
  module EntriesControllerConcern
    def comments_index
      query = Comment::Entry.all
      query = query.where(resource: instance_exec(&resource_of_comments))
      @comments = comments_filter(query)
      render json: @comments.as_json(only: [:content])
    end

    def create_comment
      entry = Comment::Entry.new(
        user_id: comment_user_id,
        resource: instance_exec(&resource_of_comments),
        content: params[:content])
      if entry.save
        head 200
      else
        head 403
      end
    end

    private

    def comments_filter(query)
      query
    end

    def comment_user_id
      defined?(current_user) && current_user && current_user.id
    end
  end
end
