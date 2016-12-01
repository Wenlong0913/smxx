module Favorite
  module EntriesControllerConcern
    def show_favorite
      @favorite = favorite__resolve_resource.favorites.where(user_id: favorite__user_id)
      if @favorite.blank?
        render json: false
      else
        render json: true
      end
    end

    def create_favorite
      entry = favorite__resolve_resource.favorites.new()
      entry.user_id = favorite__user_id
      if entry.save
        render json: true
      else
        head 403
      end
    end

    def delete_favorite
      entry = favorite__resolve_resource.favorites.where(user_id: favorite__user_id).first
      if entry.blank?
        head 403
      else
        entry.destroy
        render json: false
      end
    end

    private

    def favorite__user_id
      defined?(current_user) && current_user && current_user.id
    end

    def favorite__resolve_resource
      resource =
        case resource_of_favorites
        when Proc; instance_exec(&resource_of_favorites)
        when Symbol; __send__(resource_of_favorites)
        else
          resource_of_favorites.find(params[:id])
        end
    end
  end
end
