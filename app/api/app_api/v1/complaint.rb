module AppAPI::V1
  class Complaint < Grape::API
    resources :complaints do

      desc '投诉'
      params do
        requires :source_type, type: String, values: ['article', 'comment'], desc: "文章，评论"
        requires :source_id, type: Integer, desc: "投诉内容编号"
        requires :content, type: String, desc: "投诉信息"
      end
      post do
        authenticate!
        source =
          case params[:source_type]
          when 'article'
            ::Article.find_by(id: params[:source_id])
          when 'comment'
            ::Comment::Entry.find_by(id: params[:source_id])
          else
            error! "资源不正确"
          end
        error! "投诉内容不存在" unless source
        message = if current_user.complaints.where(source: source).exists?
          "你已经投诉过了"
        else
          complaint = current_user.complaints.new(source: source, content: params[:content])
          if complaint.save
            "投诉成功"
          else
            complaint.errors.full_messages.join(', ')
          end
        end

        present message: message
      end
    end
  end
end
