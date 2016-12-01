module Favorite
  module Helpers
    def render_favorites(resource, path:)
      cell(Favorite::EntryCell, resource, path: path).()
    end
  end
end