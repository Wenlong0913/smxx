module Favorite
  module EntriesControllerConcern
    def show_favorite
      is_favorite = favorite__resolve_resource.favorites.exists?(user_id: favorite__user_id)
      render json: is_favorite
    end

    def create_favorite
      entry = favorite__resolve_resource.favorites.find_or_create_by(user_id: favorite__user_id)
      if entry.save
        render json: true
      else
        head 403
      end
    end

    def delete_favorite
      entry = favorite__resolve_resource.favorites.where(user_id: favorite__user_id).destroy_all
      render json: false
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
