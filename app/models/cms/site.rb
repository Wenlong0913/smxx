# == Schema Information
#
# Table name: cms_sites
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  template     :string           not null
#  domain       :string
#  description  :string
#  features     :jsonb
#  is_published :boolean          default(TRUE)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  site_id      :integer
#

class Cms::Site < ApplicationRecord
  has_many :channels, dependent: :destroy
  has_many :pages, through: :channels
  belongs_to :site, class_name: '::Site'
  after_create :initialize_channel

  validates :name, :template, :domain, :description, presence: true
  validates_uniqueness_of :domain
  validates :domain, format: { with: /\A[a-z0-9]+\z/,
    message: "域名只能包括字母和数字, 字母必须为小写" }

  def template_dir
    "#{Rails.root}/public/templetes/#{template}/"
  end

  def template_list
    Dir.chdir(template_dir)
    Dir.glob("[^_]*.erb").sort
  end

  def beauty_url
    @beauty_url = true
    self
  end

  def to_param
    @beauty_url ? "#{id}" : id.to_s
  end

  def show_published
    is_published ? '已发布' : '未发布'
  end

  private
  def initialize_channel
    channel = self.channels.build(
      title: '首页',
      short_title: 'index',
      tmp_index: 'temp_index.html.erb',
      tmp_detail: 'temp_detail.html.erb'
    )
    channel.save!
  end
end
