module ActionDispatch::Routing
  class Mapper
    def commentable(model:)
      model.has_many_comments
      member do
        get :comments, action: :comments_index, format: :json
        post :comments, action: :create_comment, format: :json
      end
    end
  end
end
