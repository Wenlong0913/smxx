module Comment
  module EntriesControllerConcern
    def comments_index
      @comments = comment__filter(comment__resolve_resource.comments)
      render json: @comments.as_json(only: [:content])             
    end

    def create_comment
      entry = comment__resolve_resource.comments.new(comment__permitted_params)
      entry.user_id = comment__user_id
      if entry.save
        render js: "$('form').before(\"<p><i>##{entry.id}</i>#{entry.content}</p>\")"
      else
        render js: "alert('评论发表失败')"
      end
    end

    private

    def comment__filter(query)
      query
    end

    def comment__user_id
      defined?(current_user) && current_user && current_user.id
    end

    def comment__resolve_resource
      resource =
        case resource_of_comments
        when Proc; instance_exec(&resource_of_comments)
        when Symbol; __send__(resource_of_comments)
        else
          resource_of_comments.find(params[:id])
        end
    end

    def comment__permitted_params
      params.require(:comment).permit(:content)
    end
  end
end
