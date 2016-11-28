module Comment
  module EntriesControllerConcern
    def comments_index
      @comments = comment__filter(comment__resolve_resource.comments.page(params[:page]))
      render json: comment__entry_json(@comments)
    end

    def create_comment
      entry = comment__resolve_resource.comments.new(comment__permitted_params)
      entry.user_id = comment__user_id
      
      if entry.save
        render json: comment__entry_json(entry)
      else
        head 403
      end
    end

    private

    def comment__filter(query)
      query.order(created_at: :desc)
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
      params.require(:comment).permit(:parent_id, :content)
    end

    def comment__entry_json(entry, page = nil)
      comment_info = {}
      comment_info[:comment_data] =  entry.as_json(only: [:id, :content, :created_at], include: {parent: {only: [:id, :content, :created_at]}} )
      unless entry.try(:total_pages).blank?
        comment_info[:page_data] = {}
        comment_info[:page_data][:total_pages] = entry.total_pages
        comment_info[:page_data][:current_page] = entry.current_page
      end
      return comment_info
    end
  end
end
