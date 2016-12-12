class Cms::Page < ApplicationRecord
  belongs_to :channel
  has_one :site, through: :channel
  default_scope {order('updated_at DESC')}
  before_validation :sanitize_short_title
  before_validation :create_unique_short_title
  validates :channel, :title, :content, presence: true
  # validates :short_title, format: { with: /\A[a-zA-Z0-9-]+\z/,
  #   message: "名称简写只能包括字母数字和横线" }
  validates_uniqueness_of :short_title

  #最近新闻
  #eg: Cms::Page.recent(12, :rand => true)
  #    Cms::Page.recent(10, :channel => 'product-bed')
  scope :recent, ->(count = 10, options = {}) {
    assoc = reorder("updated_at DESC").limit(count)
    if options[:channel].present?
      assoc = assoc.joins(:channel).where(cms_channels: { short_title: options[:channel] })
    end
    assoc
  }
  scope :search, ->(q) { where('title LIKE ?', "%#{q}%") }

  def format_date
    self.updated_at.strftime("%Y-%m-%d") unless self.updated_at.nil?
  end

  def thumb_image_path
    self.image_path.sub(/content|original/, 'thumb')
  end

  def original_image_path
    self.image_path.sub(/content|thumb/, 'original')
  end

  def show_image
    image_path.blank? ? 'http://placehold.it/250x150' : image_path
  end

  def to_param
    "#{id}-#{short_title.parameterize}"
  end

  def beauty_url
    @beauty_url = true
    self
  end

  def to_param
    @beauty_url ? "#{id}-#{short_title}" : id.to_s
  end

  private

  def sanitize_short_title
    self.short_title = short_title.parameterize unless short_title.nil?
  end

  def create_unique_short_title
    return if short_title.present?
    s_title = Pinyin.t(title).parameterize[0..50]
    suffix = nil
    loop do
      self.short_title = "#{s_title}#{suffix}"
      query = channel.pages.where(short_title: short_title)
      query = query.where("id != ?", id) if self.persisted?
      break unless query.exists?
      suffix ||= '-'
      suffix += ('a'..'z').to_a.sample
    end
  end

end
