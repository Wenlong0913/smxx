module ActionDispatch::Routing
  class Mapper
    def commentable
      member do
        get :comments, action: :comments_index, format: :json
        post :comments, action: :create_comment, format: :json
        post :replies, action: :create_reply, format: :json
      end
    end
  end
end
