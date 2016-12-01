module Favorite
  module HasManyFavorites
    extend ActiveSupport::Concern

    class_methods do
      def has_many_favorites
        has_many :favorites, class_name: 'Favorite::Entry', dependent: :destroy, as: :resource
      end
    end
  end
end