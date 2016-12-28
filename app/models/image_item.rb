class ImageItem < ApplicationRecord
  belongs_to :owner, polymorphic: true
  validates_presence_of :owner, :data
  has_many :image_item_tags, dependent: :destroy
  has_many :image_item_relations, dependent: :destroy

  has_attached_file :image,
                    path: ":rails_root/public/photos/:id/:style.:extension",
                    hash_secret: 'f240-r3i-3-',
                    styles: { :original => '800>'},
                    :url => "/photos/:id/:style.:extension",
                    default_url: "/images/:style/missing.png"


  # validates_attachment_presence :image
  # validates_attachment_size :image, :less_than => 4.megabytes

  validates_attachment_content_type :image, :content_type => /\Aimage/

  def image_url
    "http://" + Settings.site.host + image.url
  end
end
