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

_, admin = User::Create.(id: 1, mobile_phone: '15328077520', nickname: '管理员', password: 'abcd1234')
_, agent = User::Create.(mobile_phone: '15328077521', nickname: '商家', password: 'abcd1234')
_, user = User::Create.(mobile_phone: '15328077522', nickname: '用户', password: 'abcd1234')

admin.add_role :admin
agent.add_role :agent

Site.create(id: 1, title: '本公司', user: admin)

# 德格角色
%w(product_manager factory_manager).each do |name|
  Role.find_or_create_by name: name
end

# init Cms
# visit: http://localhost:3000/cms_1/
cms_site = Cms::Site.create!(name: '企业官网', template: 'default', description: '这是用CMS搭建的官网')
cms_channel = Cms::Channel.create!(site_id: cms_site.reload.id, title: '首页', description: '这里是首页的栏目描述', short_title: 'index', tmp_index: 'temp_index.html.erb', tmp_detail: 'temp_detail.html.erb')
cms_channel = Cms::Channel.create!(site_id: cms_site.reload.id, title: '新闻列表', description: '这里是新闻的栏目描述', short_title: 'news', tmp_index: 'temp_news_list.html.erb', tmp_detail: 'temp_detail.html.erb')
content = ''
5.times{|i| content += '<p>这是内容部分!</p>'}
5.times do
  cms_page = Cms::Page.create!(channel_id: cms_channel.reload.id, title: '这是新闻标题', description: '这里是页面的描述', content: content)
end

names = %w(日用品
生鲜食品
海外商品
旅游
运功
娱乐
电子
电器
)

names.each do |name|
  Catalog.find_or_create_by(name: name)
end
