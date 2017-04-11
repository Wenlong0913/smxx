module AppAPI::V1
  class Comment < Grape::API
    helpers AppAPI::SharedParams
    resources :comments do

      desc '评论商品' do
        success AppAPI::Entities::Comment
      end
      params do
        requires :id, type: Integer, desc: '产品ID'
        requires :content, type: String, desc: '评论或者回复内容'
        optional :parent_id, type: Integer, desc: '如果填写，parent_id就是回复的某条评论的ID'
      end
      post do
        authenticate!
        product = ::Product.find_by(id: params[:id])
        error! '该产品不存在' unless product

        comment_attributes = {}
        comment_attributes[:content]  = params[:content]
        comment_attributes[:parent]   = ::Comment::Entry.where(id: params[:parent_id]).first unless params[:parent_id].blank?
        comment_attributes[:resource] = product

        comment = current_user.comments.new(comment_attributes)
        if comment.save
          present comment, with: AppAPI::Entities::Comment
        else
          error! comment.errors
        end
      end

    end # end of resources
  end
end
