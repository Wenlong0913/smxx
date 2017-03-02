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
admin.add_role :super_admin
agent.add_role :agent

site = Site.create(title: '本公司', user: admin)
raise "创建的第一个代理商ID不等于1!!!" unless site.id == 1

# 德格角色
%w(product_manager factory_manager).each do |name|
  Role.find_or_create_by name: name
end

# init Cms
# visit: http://localhost:3000/cms_1/
cms_site = Cms::Site.create!(site_id: site.id, name: '企业官网', template: 'default', description: '这是用CMS搭建的官网')
# Cms::Site after_create :initialize_channel　已经存在，会自动创建一个首页
# cms_channel = Cms::Channel.create!(site_id: cms_site.reload.id, title: '首页', description: '这里是首页的栏目描述', short_title: 'index', tmp_index: 'temp_index.html.erb', tmp_detail: 'temp_detail.html.erb')
cms_channel = Cms::Channel.create!(site_id: cms_site.reload.id, title: '新闻列表', description: '这里是新闻的栏目描述', short_title: 'news', tmp_index: 'temp_news_list.html.erb', tmp_detail: 'temp_detail.html.erb')
content = ''
5.times{|i| content += '<p>这是内容部分!</p>'}
5.times do
  cms_page = Cms::Page.create!(channel_id: cms_channel.reload.id, title: '这是新闻标题', description: '这里是页面的描述', content: content)
end

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

# 创建仓库
puts "创建初始仓库"
MaterialWarehouse::Create.(site_id: Site.first.id, name: '初始仓库')

# 德格物料分类 & 物料
puts "创建物料分类 & 物料"
material_catalogs = {
  "柜体": [{'板材': []}, {'五金': []}, {'封边带': []}, {'纸箱': []}, {'气泡垫/珍珠棉': []}, {'油漆': []}, {'刀具': []}, {'封口胶': []}, {'胶': []}, {'旋转鞋柜': []}, {'密码抽': []}, {'反转床': []}, {'穿衣镜': []}],
  "移门": [{'五金': []}, {'皮纹/软包': []}, {'玻璃/腰线': []}, {'型材': []}],
  "平开门": [{'五金': []}, {'吸塑': []}]
}
material_catalogs.each_pair do |material_catalog, sub_material_catalos|
  _, material_catalog = MaterialCatalog::Create.(name: material_catalog)
  sub_material_catalos.each do |sub_material|
    sub_material.each_pair do |next_catalog, materials|
      _, next_catalog = MaterialCatalog::Create.(name: next_catalog, parent: material_catalog)
      5.times do | index |
        _, material = Material::Create.(name: next_catalog.name + (index+1).to_s, catalog: next_catalog, site_id: Site.first.id)
      end
    end
  end
end

# 客户
MemberCatalog.create!(key: '客户级别', value: '{A类,B类,C类}')
MemberCatalog.create!(key: '会员关系', value: '{非会员,普通会员,银卡会员,金卡会员,至尊会员}')
MemberCatalog.create!(key: '客户性别', value: '{男,女}')
MemberCatalog.create!(key: '客户年龄', value: '{15-20,20-30,30-40,40-50,50-60}')
MemberCatalog.create!(key: '购买能力', value: '{一般,高,很高}')
MemberCatalog.create!(key: '客户活跃频次', value: '{很少,一般,高,很高}')

# 营销页
MarketCatalog.create!(name: '博客')
MarketCatalog.create!(name: '活动')
MarketCatalog.create!(name: '招商')
MarketCatalog.create!(name: '会员拉新')

MarketTemplate.create!(
  catalog_id: 1,
  base_path: 'templetes/market/default',
  name: 'default',
  keywords: '营销页测试页',
  description: '这只是一个测试页面，可以实现类似一篇博客文章发布',
  image_path: '/templetes/market/default/previews/demo-1.png',
  html_source: '
    <html lang="zh-CN">
      <head>
        <meta charset="utf-8"/>
        <title><%= @market_page.name %></title>
        <meta content="<%= @market_page.description %>" name="description"/>
      </head>
      <body style="text-align: center;">
        <div style="margin: 0 auto; width:640px;">
          <h2><%= @market_page.value_for("title", title: "文章标题", typo: "string", default: "文章标题") %></h2><hr/>
          <div style="text-align:left;"><%= simple_format @market_page.value_for("content", title: "正文", typo: "text", default: "文章内容") %></div>
          <% @market_page.image_items.each do |img| %>
           <%= image_tag img.image_url, style: "width:100%;" %>
          <% end %>
        </div>
      </body>
    </html>'
)
