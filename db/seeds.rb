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
cms_site = Cms::Site.create!(name: '企业官网', template: 'default', description: '这是用CMS搭建的官网')
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

<<<<<<< HEAD
# 营销页
MarketTemplate.create!(
  catalog_id: 1,
  base_path: 'templetes/market/snow',
  name: 'snow',
  keywords: '雪，圣诞祝福海报',
  description: '圣诞节外发给客户的祝福海报',
  image_path: '/templetes/market/snow/previews/demo-3.png',
  html_source: '<!doctype html>
    <html lang="zh-CN">
    <head>
      <title><%= @market_page.name %></title>
      <meta name="description" content="<%= @market_page.description %>" />
      <meta charset="utf-8" />
      <meta name="apple-touch-fullscreen" content="YES" />
      <meta name="format-detection" content="telephone=no" />
    </head>

    <body>
     <h1>圣诞节快乐！</h1>
     <p><%= @market_page.features['title'] %></p>
     <p><%= @market_page.features['mobile'] %></p>
    </body>
    </html>',
  form_source: '公司：<br/>
    <input class="string " name="mpage[title]" value="<%=@market_page.features['title'] if @market_page.features%>" type="string" />

    <br/>
    联系电话：<br/>
     <input class="string " name="mpage[mobile]"  value="<%=@market_page.features['mobile']  if @market_page.features%>" type="string" />
    '
)
=======
#物料类别所特有的属性
#物料共有属性：价格, 单位，品牌，供应商， 图片
material_catalog_attributes = {
  "板材": ['颜色', '厚度', '单／双', '表面处理', '基材名称', '基材等级'],
  "五金": ['规格', '颜色'],
  "封边带": ['规格', '颜色'],
  "纸箱": ['规格', '颜色'],
  "气泡垫/珍珠棉": ['规格', '颜色'],
  "皮纹/软包": ['规格'],
  "玻璃/腰线": ['规格', '颜色', '厚度'],
  "吸塑": ['型号', '颜色']
}

material_catalog_attributes.each_pair do |material_catalog, attributes|
  mc = MaterialCatalog.where(name: material_catalog).first
  mc.features = {attributes: attributes}
  mc.save!
end



>>>>>>> purchase
