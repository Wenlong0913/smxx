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
        comment_attributes[:user]     = current_user

        comment = product.comments.new(comment_attributes)
        if comment.save
          present comment, with: AppAPI::Entities::Comment
        else
          error! comment.errors
        end
      end

      desc '商品评论列表' do
        success AppAPI::Entities::Comment.collection
      end
      params do
        requires :id, type: Integer, desc: '产品ID'
        use :pagination
        use :sort, fields: [:created_at]
      end
      get do
        product = ::Product.find_by(id: params[:id])
        error! '该产品不存在' unless product

        # 该商品的所有评论
        comments = product.comments
        # 当前页的评论
        comments = paginate_collection(sort_collection(comments), params)
        # 获取需要额外加载的父级评论类容
        extra_ids = (comments.pluck(:parent_id).uniq - comments.pluck(:id)).compact
        extra_comments = ::Comment::Entry.where("id in (?)", extra_ids)
        
        wrap_collection(comments, AppAPI::Entities::Comment, options={user_id: (current_user.id rescue nil)})
        present :parents, extra_comments, with: AppAPI::Entities::Comment
      end

      desc '店铺评论列表' do
        success AppAPI::Entities::Comment.collection
      end
      params do
        requires :site_id, type: Integer, desc: '店铺ID'
        use :pagination
        use :sort, fields: [:created_at]
      end
      get 'site' do
        site = ::Site.find_by(id: params[:site_id])
        error! '该店铺不存在' unless site

        # 该店铺的所有评论
        comments = ::Comment::Entry.where(resource: site)
        # 当前页的评论
        comments = paginate_collection(sort_collection(comments), params)
        # 获取需要额外加载的父级评论类容
        extra_ids = (comments.pluck(:parent_id).uniq - comments.pluck(:id)).compact
        extra_comments = ::Comment::Entry.where("id in (?)", extra_ids)
        
        wrap_collection(comments, AppAPI::Entities::Comment, options={})
        present :parents, extra_comments, with: AppAPI::Entities::Comment
      end

      desc '评论点赞'
      params do
        requires :id, type: Integer, desc: "评论ID"
      end
      post ':id/like' do
        authenticate!
        comment = ::Comment::Entry.find(params[:id])
        message = ''
        if current_user.likes.tagged_to? comment
          message = '已经点赞了此评论!'
        else
          current_user.likes.tag_to! comment
          message = '评论点赞成功!'
        end
        present message: message
      end

      desc '取消点赞评论'
      params do
        requires :id, type: Integer, desc: "评论ID"
      end
      delete ':id/like' do
        authenticate!
        comment = ::Comment::Entry.find(params[:id])
        if current_user.likes.tagged_to? comment
          current_user.likes.untag_to! comment
        end
        present message: '评论取消点赞成功!'
      end

      desc '是否点赞了此评论'
      params do
        requires :id, type: Integer, desc: "#{::Product.model_name.human}ID"
      end
      post ':id/is_liked' do
        authenticate!
        comment = ::Comment::Entry.find(params[:id])
        is_liked = if current_user.likes.tagged_to? comment
          true
        else
          false
        end
        present is_liked: is_liked
      end
    end
  end
end
