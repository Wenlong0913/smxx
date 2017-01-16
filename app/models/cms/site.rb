class Cms::Site < ApplicationRecord
  has_many :channels, dependent: :destroy
  has_many :pages, through: :channels
  after_create :initialize_channel

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
