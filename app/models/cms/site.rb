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
  audited
  has_many :channels, -> { order(id: :asc) }, dependent: :destroy
  has_many :keystores, dependent: :destroy
  has_many :pages, through: :channels
  has_many :comments, dependent: :destroy
  belongs_to :site, class_name: '::Site'
  after_create :do_initialize

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

  #methods for keystores
  def value_for(key)
    self.keystores.find_by(key: key).try(:value) || ''
  end

  private
  def do_initialize
    return if db_init
    channel = self.channels.build(
      title: '首页',
      short_title: 'index',
      tmp_index: 'temp_index.html.erb',
      tmp_detail: 'temp_detail.html.erb'
    )
    channel.save!
  end

  def db_init
    return true if eval("@cms_site = Cms::Site.find(#{self.id})") && eval(open(File.join(template_dir,'db_init.rb')).read)
    return false
  end
end
