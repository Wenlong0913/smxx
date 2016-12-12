class Cms::Site < ApplicationRecord
  has_many :channels, dependent: :destroy
  has_many :pages, through: :channels

  def template
    template ||= 'default'
  end

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

end
