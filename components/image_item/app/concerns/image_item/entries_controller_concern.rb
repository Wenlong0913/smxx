module ImageItem
  module EntriesControllerConcern

    def image_items_index
      @image_items = image_item__filter(get_image_item_resource.image_items)
      render json: image_item__entry_json(@image_items)
    end

    def process_image_item
      if params[:image_item_entry].present?
        if params[:deleted]
          delete_image_item
        else
          update_image_item
        end
      else
        create_image_item
      end
    end

    private

    def image_item__filter(query)
      query.order(created_at: :desc)
    end

    def image_item__resolve_resource
      resource =
        case resource_of_image_items
        when Proc; instance_exec(&resource_of_image_items)
        when Symbol; __send__(resource_of_image_items)
        else
          resource_of_image_items.find(params[:id])
        end
    end

    def image_item__user_id
      defined?(current_user) && current_user && current_user.id
    end

    def move_image_data_to_resource(resource, min = 1)
      image_item_resource = get_image_item_resource
      image_items = image_item_resource.image_items
      if image_items.size < min
        resource.errors.add(:image_items, "至少#{min}张图片")
      else
        if image_item_resource != resource
          resource.image_items = image_items
          image_item_resource.image_items = []
          image_item_resource.destroy
        end   
      end
    end


    def create_image_item
      entry = ImageItem::Entry.new(image_data: params[:image_data])
      image_item_resource = get_image_item_resource
      entry.user_id = image_item__user_id
      if entry.save
        image_item_resource.image_items << entry
        render json: {entry_id: entry.id}
      else
        head 403
      end
    end

    def update_image_item
      entry = ImageItem::Entry.find(params[:image_item_entry])
      entry.image_data = params[:image_data]
      if entry.save
        render json: {entry_id: entry.id}
      else
        head 403
      end
    end

    def delete_image_item
      entry = ImageItem::Entry.find(params[:image_item_entry])
      image_item_resource = get_image_item_resource
      image_item_resource.image_items.delete(entry)
      if entry.destroy
        render json: {}
      else
        head 403
      end
    end

    def get_image_item_resource
      image_item_resource_type, image_item_resource_id =  params[:image_item_resource].split(',')
      image_item_resource_type.constantize.find(image_item_resource_id)
    end

    def image_item__entry_json(entry)
      entry.as_json(only: [:id], methods: :image_data)
    end
  end
end
