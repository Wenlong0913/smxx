
@site = Cms::Site.create!(
  :name         => 'dagle',
  :template     => 'dagle',
  :domain       => 'dagle',
  :description  => 'dagle',
  :is_published => true
)
Cms::Channel.create!(
  :site_id      => @site.id,
  :parent_id    => nil,
  :title        => '首页',
  :short_title  => 'index',
  :properties   => 'nil',
  :tmp_index    => 'temp_index.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => 'nil',
  :description  => 'nil',
  :image_path   => 'nil',
  :content      => 'nil'
)
Cms::Channel.create!(
  :site_id      => @site.id,
  :parent_id    => nil,
  :title        => '桌面端',
  :short_title  => 'desk',
  :properties   => '',
  :tmp_index    => 'temp_index_desk.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => '',
  :description  => '',
  :image_path   => '',
  :content      => ''
)
Cms::Channel.create!(
  :site_id      => @site.id,
  :parent_id    => nil,
  :title        => '手机端',
  :short_title  => 'mobile',
  :properties   => '',
  :tmp_index    => 'temp_index_mobile.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => '',
  :description  => '',
  :image_path   => '',
  :content      => ''
)
Cms::Channel.create!(
  :site_id      => @site.id,
  :parent_id    => 4,
  :title        => '更新日志',
  :short_title  => 'log',
  :properties   => '',
  :tmp_index    => 'temp_log_list.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '更新日志',
  :description  => '',
  :image_path   => '',
  :content      => ''
)
Cms::Channel.create!(
  :site_id      => @site.id,
  :parent_id    => nil,
  :title        => '博客',
  :short_title  => 'blog',
  :properties   => '',
  :tmp_index    => 'temp_news_list.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '博客',
  :description  => '',
  :image_path   => '',
  :content      => ''
)
Cms::Channel.create!(
  :site_id      => @site.id,
  :parent_id    => nil,
  :title        => '技术支持',
  :short_title  => 'support',
  :properties   => '',
  :tmp_index    => 'temp_support_list.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '技术支持',
  :description  => '',
  :image_path   => '',
  :content      => ''
)
Cms::Channel.create!(
  :site_id      => @site.id,
  :parent_id    => 9,
  :title        => '常见问题',
  :short_title  => 'faq',
  :properties   => '',
  :tmp_index    => 'temp_faq.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '常见问题',
  :description  => '',
  :image_path   => '',
  :content      => ''
)
Cms::Page.create!(
  :channel_id   => 8,
  :title        => 'SaaS安全吗？',
  :short_title  => 'saas-an-quan-ma',
  :keywords     => '',
  :description  => '',
  :properties   => 'nil',
  :image_path   => '',
  :content      => 'nil'
)
Cms::Page.create!(
  :channel_id   => 8,
  :title        => '案发违法',
  :short_title  => 'an-fa-wei-fa',
  :keywords     => '',
  :description  => '',
  :properties   => 'nil',
  :image_path   => '/ckeditor_assets/pictures/1/content_color.jpg',
  :content      => 'nil'
)