module Like
  class Base < ApplicationRecord
    self.table_name = 'likes'
    belongs_to :user
    belongs_to :resource, polymorphic: true
    validates_presence_of :resource, :user
  end
end
