class Cms::Site < ApplicationRecord
  has_many :channels, dependent: :destroy

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

end
