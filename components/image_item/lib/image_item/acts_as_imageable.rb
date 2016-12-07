module ImageItem
  module ActsAsImageable
    extend ActiveSupport::Concern

    class_methods do
      def acts_as_imageable(resource:)
        include ImageItem::EntriesControllerConcern
        helper ImageItem::Helpers
        define_method :resource_of_image_items do
          resource
        end
      end
    end
  end
end
