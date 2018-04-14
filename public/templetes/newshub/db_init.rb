@cms_site.keystores.find_or_create_by(key:'site_name', value: '文广通')
@cms_site.keystores.find_or_create_by(key:'index-ad-banner01', value: 'http://s.tanmer.cn/qgm2|#link|【演出】 永恒经典：奥黛丽·赫本展')
@cms_site.keystores.find_or_create_by(key:'index-ad-banner02', value: 'http://s.tanmer.cn/qgm3|#link|【演出】 2017嘻哈中国成都站')
@cms_site.keystores.find_or_create_by(key:'index-ad-banner03', value: 'http://s.tanmer.cn/qgm4|#link|【演出】 “快乐在路上”2018至乐汇《驴得水Mr. Donkey》荒诞戏剧（成都站）')

# @cms_site.keystores.find_or_create_by(key:'latitude', value: '30.668283')
# @cms_site.keystores.find_or_create_by(key:'longitude', value: '104.127826')

@cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '首页',
  :short_title  => 'index',
  :tmp_index    => 'temp_index.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => '文广通，文体云，文化云，公共文化服务大数据',
  :description  => '文广通给您享要的文化生活',
  :content      => %{nil})

@cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '新闻资讯',
  :short_title  => 'news',
  :tmp_index    => 'temp_news_list.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '文广通，文体云，文化云，公共文化服务大数据',
  :description  => '文广通给您享要的文化生活',
  :content      => %{nil})

#关于我们、联系我们、场馆入驻、使用帮助
@cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '更多服务',
  :short_title  => 'about',
  :tmp_index    => 'temp_channel.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => '关于文广通，文体云，文化大数据，公共文化服务',
  :description  => '文广通系统的目的是为了开发一套满足各地区、具有实用功能性、有社区活力的文化云系统',
  :content      => %{这里填写关于我们的详细介绍})
