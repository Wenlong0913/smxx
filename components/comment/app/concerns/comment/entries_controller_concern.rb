module Comment
  module EntriesControllerConcern
    def comments_index
      total_page = comment__resolve_resource.comments.page(1).per(10).total_pages
      current_page = params[:page].blank? ? total_page : params[:page]
      @comments = comment__filter(comment__resolve_resource.comments.page(current_page).per(10))
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
      query.order(created_at: :asc)
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
      params.require(:comment).permit(:parent_id, :content, :offer , :image_item_ids => [], :attachment_ids => [])
    end

    def comment__entry_json(entry, page = nil)
      comment_info = {}
      comment_info[:comments] =  entry.as_json(
        only: [:id, :content, :created_at],
        methods: [:offer],
        include: {
          user: {only: [:id, :nickname], methods: [:display_headshot]},
          parent: {only: [:id, :content, :created_at], include: { user: { only: [:nickname], methods: [:display_headshot] } }},
          attachments: {only: [:id], methods: [:attachment_url, :attachment_file_name, :attachment_content_type]},
          image_items: {only: [:id], methods: [:image_url, :image_file_name]}
        }
      )
      if entry.try(:total_pages)
        comment_info[:total_pages] = entry.total_pages
        comment_info[:current_page] = entry.current_page
      end
      return comment_info
    end

  end
end
