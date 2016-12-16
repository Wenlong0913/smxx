#copy below into db/seeds.rb
#
cms_site = Cms::Site.create!(name: '企业官网', template: 'default', description: '这是用CMS搭建的官网')
cms_channel = Cms::Channel.create!(site_id: cms_site.reload.id, title: '首页', description: '这里是首页的栏目描述', short_title: 'index', tmp_index: 'temp_index.html.erb', tmp_detail: 'temp_detail.html.erb')
cms_channel = Cms::Channel.create!(site_id: cms_site.reload.id, title: '新闻列表', description: '这里是新闻的栏目描述', short_title: 'news', tmp_index: 'temp_news_list.html.erb', tmp_detail: 'temp_detail.html.erb')
content = ''
5.times{|i| content += '<p>这是内容部分!</p>'}
5.times do
  cms_page = Cms::Page.create!(channel_id: cms_channel.reload.id, title: '这是新闻标题', description: '这里是页面的描述', content: content)
end
