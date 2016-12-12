class Cms::Channel < ApplicationRecord
  belongs_to :site
  has_many :pages, -> { order(updated_at: :asc) }, dependent: :destroy
  has_many :children, class_name: "Cms::Channel",
                          foreign_key: "parent_id",
                          dependent: :destroy

  belongs_to :parent, class_name: "Cms::Channel"

  validates :title, :short_title, :tmp_index, :tmp_detail, presence: true
  validates_uniqueness_of :short_title
  validates :short_title, format: { with: /\A[a-zA-Z0-9-]+\z/,
    message: "名称简写只能包括字母数字和横线" }

  before_validation :sanitize_short_title

  def beauty_url
    @beauty_url = true
    self
  end

  def to_param
    @beauty_url ? short_title : id.to_s
  end

  private

  def sanitize_short_title
    self.short_title = short_title.parameterize unless short_title.nil?
  end
end
