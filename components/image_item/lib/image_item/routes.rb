module ActionDispatch::Routing
  class Mapper
    def imageable
      collection do
        post :image_item, action: :process_image_item
        get :image_item, action: :image_items_index
      end
    end
  end
end
