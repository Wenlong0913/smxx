class Community < ApplicationRecord
  audited
  acts_as_address
  validates_presence_of :name, :address_line
  # ["uid", "name", "province", "city", "district", "street", "address", "telephone", "lat", "lng", "tags", "image", "keyword"]
  store_accessor :features, :uid, :province, :city, :district, :street, :address_str, :telephone, :lat, :lng, :tags, :image, :keyword

  has_many :chat_rooms, as: :owner, class_name: 'Chat::Room', dependent: :destroy
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities
  after_save :create_chat_rooms


  def create_chat_rooms
    self.chat_rooms.create(name: self.name + '公共圈')
  end
end
