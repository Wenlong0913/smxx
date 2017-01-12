# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w(super_admin admin agent).each do |name|
  Role.find_or_create_by name: name
end

_, admin = User::Create.(mobile_phone: '15328077520', nickname: '管理员', password: 'abcd1234')

raise "创建的第一个用户ID不等于1!!!" unless admin.id == 1

_, agent = User::Create.(mobile_phone: '15328077521', nickname: '商家', password: 'abcd1234')
_, user = User::Create.(mobile_phone: '18080810818', nickname: '用户', password: 'abcd1234')

admin.add_role :admin
agent.add_role :agent

site = Site.create(title: '本公司', user: admin)
raise "创建的第一个代理商ID不等于1!!!" unless site.id == 1

# 德格角色
%w(product_manager factory_manager).each do |name|
  Role.find_or_create_by name: name
end

# init Cms
# visit: http://localhost:3000/cms_1/
Cms::Site.create!(
  :name         => 'dagle',
  :template     => 'dagle',
  :domain       => 'dagle',
  :description  => 'dagle',
  :is_published => true
)
Cms::Channel.create!(
  :site_id      => '4',
  :parent_id    => 'nil',
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
  :site_id      => '4',
  :parent_id    => 'nil',
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
  :site_id      => '4',
  :parent_id    => 'nil',
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
  :site_id      => '4',
  :parent_id    => '4',
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
  :site_id      => '4',
  :parent_id    => 'nil',
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
  :site_id      => '4',
  :parent_id    => 'nil',
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
  :site_id      => '4',
  :parent_id    => '9',
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
# names = %w(日用品
# 生鲜食品
# 海外商品
# 旅游
# 运功
# 娱乐
# 电子
# 电器
# )

# names.each do |name|
#   Catalog.find_or_create_by(name: name)
# end


# 德格供应商
puts "创建供应商"
vendor_names = ["自购", "康鑫", "联利达五金", "友达", "锐丰", "壹佰", "盛世百龙", "义力", "山森科技", "精工", "申康", "同乐", "上海画宇", "大家木业", "蒙友", "朋诚心", "尚好佳", "同鑫", "君子兰", "银冠", "爱格", "恒泰"]
vendor_names.each do |vendor_name|
  _, vendor_user = Vendor::Create.(name: vendor_name, contact_name: vendor_name + '联系人', phone_number: '152133643' + (10..99).to_a.sample(1).join)
end

# 德格物料分类
puts "创建物料分类"
material_catalogs = {"柜体": %w(板材 五金 封边带 纸箱 气泡垫/珍珠棉 油漆 刀具 封口胶 胶 旋转鞋柜 密码抽 反转床 穿衣镜), "移门": %w(五金 皮纹/软包 玻璃/腰线 型材), "平开门": %w(五金 吸塑)}
material_catalogs.each_pair do |material_catalog, sub_material_catalos|
  _, material_catalog = MaterialCatalog::Create.(name: material_catalog)
  sub_material_catalos.each do |sub_material|
    _, sub_material_catalog = MaterialCatalog::Create.(name: sub_material, parent: material_catalog)
  end
end
