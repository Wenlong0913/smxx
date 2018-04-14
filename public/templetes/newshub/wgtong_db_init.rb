#初始化地方站
Community.find_or_create_by!(name: '四川', address_line: '四川省成都市天府广场')
Community.find_or_create_by!(name: '北京', address_line: '北京市天安门')
Community.find_or_create_by!(name: '上海', address_line: '上海市外滩广场')

#初始化场馆分类
puts "创建商家、社团分类"
names = %w(场馆
剧院
图书馆
社团
志愿者
其他
)

names.each do |name|
  SiteCatalog.find_or_create_by(name: name)
end

#初始化产品活动分类
puts "创建活动、产品分类"
names = %w(演出
讲座
展览
体育
培训
赛事
亲子
读书
音乐影视
其他
)

names.each do |name|
  ProductCatalog.find_or_create_by(name: name)
end

# 获取地图坐标：http://api.map.baidu.com/lbsapi/getpoint/index.html
# @cms_site.keystores.find_or_create_by(key:'set_content_image', value: 'true')
# @cms_site.keystores.find_or_create_by(key:'set_thumb_image_path', value: 'true')

@cms_site.keystores.find_or_create_by(key:'site_name', value: '文广通')
@cms_site.keystores.find_or_create_by(key:'slogan', value: '公共文化服务大数据云平台')
@cms_site.keystores.find_or_create_by(key:'description', value: '文广通系统的目的是为了开发一套满足各地区、具有实用功能性、有社区活力的文化云系统。系统整合了全网文化数字资源，为大众提供一个一站式文化消费大数据平台')
@cms_site.keystores.find_or_create_by(key:'firm_name', value: '成都世联广慧科技有限公司')
@cms_site.keystores.find_or_create_by(key:'tel_phone', value: '028-82157660')
@cms_site.keystores.find_or_create_by(key:'mobile_phone', value: '18080810818')
@cms_site.keystores.find_or_create_by(key:'email', value: 'ad@wgtong.com')
@cms_site.keystores.find_or_create_by(key:'address', value: '成都市.高新区')
@cms_site.keystores.find_or_create_by(key:'icp', value: 'ICP: 蜀3403A323号')

# @cms_site.keystores.find_or_create_by(key:'latitude', value: '30.668283')
# @cms_site.keystores.find_or_create_by(key:'longitude', value: '104.127826')

ch_index = @cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '首页',
  :short_title  => 'index',
  :tmp_index    => 'temp_index.html.erb',
  :tmp_detail   => 'nil',
  :keywords     => '文广通，文体云，文化云，公共文化服务大数据',
  :description  => '文广通系统的目的是为了开发一套满足各地区、具有实用功能性、有社区活力的文化云系统。系统整合了全网文化数字资源，为大众提供一个一站式文化消费大数据平台',
  :content      => %{nil})
#活动场馆
@cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '活动场馆',
  :short_title  => 'sites',
  :tmp_index    => 'temp_sites_list.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => '文广通，文体云，文化云，公共文化服务大数据',
  :description  => '文广通系统的目的是为了开发一套满足各地区、具有实用功能性、有社区活力的文化云系统。系统整合了全网文化数字资源，为大众提供一个一站式文化消费大数据平台',
  :content      => %{nil})
#活动列表
@cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '活动列表',
  :short_title  => 'products',
  :tmp_index    => 'temp_products_list.html.erb',
  :tmp_detail   => 'temp_products_dtail.html.erb',
  :keywords     => '文广通，文体云，文化云，公共文化服务大数据',
  :description  => '文广通系统的目的是为了开发一套满足各地区、具有实用功能性、有社区活力的文化云系统。系统整合了全网文化数字资源，为大众提供一个一站式文化消费大数据平台',
  :content      => %{nil})
#应急公告系统
@cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '公告系统',
  :short_title  => 'articles',
  :tmp_index    => 'temp_article_list.html.erb',
  :tmp_detail   => 'temp_article_dtail.html.erb',
  :keywords     => '文广通，文体云，文化云，公共文化服务大数据',
  :description  => '文广通系统的目的是为了开发一套满足各地区、具有实用功能性、有社区活力的文化云系统。系统整合了全网文化数字资源，为大众提供一个一站式文化消费大数据平台',
  :content      => %{nil})
#文化项目信息分类
ch_pro = @cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '项目分类',
  :short_title  => 'projects',
  :tmp_index    => 'temp_news_list.html.erb',
  :tmp_detail   => 'temp_news_detail.html.erb',
  :keywords     => '项目分类，文广通，文体云，文化云，公共文化服务',
  :description  => '文广通公共文化服务大数据平台',
  :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '国学',
    :short_title  => 'guoxue',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '国学，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '人物',
    :short_title  => 'renwu',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '人物，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '文遗',
    :short_title  => 'wenyi',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '文遗，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '生活',
    :short_title  => 'shenghuo',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '生活，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '旅游',
    :short_title  => 'lvyou',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '旅游，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '饮食',
    :short_title  => 'yinshi',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '饮食，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '体育',
    :short_title  => 'tiyu',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '体育，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '书画',
    :short_title  => 'shuhua',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '书画，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '音乐',
    :short_title  => 'yinyue',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '音乐，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '影视',
    :short_title  => 'yingshi',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '影视，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '曲艺',
    :short_title  => 'quyi',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '曲艺，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '戏剧',
    :short_title  => 'xiju',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '戏剧，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '文物',
    :short_title  => 'wenwu',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '文物，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})
  @cms_site.channels.create!(
    :parent_id    => ch_pro.id,
    :title        => '杂项',
    :short_title  => 'zaxiang',
    :tmp_index    => 'temp_news_list.html.erb',
    :tmp_detail   => 'temp_news_detail.html.erb',
    :keywords     => '杂项，文广通，文体云，文化云，公共文化服务',
    :description  => '文广通公共文化服务大数据平台',
    :content      => %{nil})


#关于我们、联系我们、场馆入驻、使用帮助
ch_about = @cms_site.channels.create!(
  :parent_id    => nil,
  :title        => '关于我们',
  :short_title  => 'about',
  :tmp_index    => 'temp_channel.html.erb',
  :tmp_detail   => 'temp_detail.html.erb',
  :keywords     => '关于文广通，文体云，文化大数据，公共文化服务',
  :description  => '文广通系统的目的是为了开发一套满足各地区、具有实用功能性、有社区活力的文化云系统',
  :content      => %{这里填写关于我们的详细介绍})

  @cms_site.channels.create!(
    :parent_id    => ch_about.id,
    :title        => '服务项目',
    :short_title  => 'service',
    :tmp_index    => 'temp_channel.html.erb',
    :tmp_detail   => 'temp_detail.html.erb',
    :keywords     => '服务项目，文广通，文体云，文化大数据，公共文化服务',
    :description  => '文广通提供文化活动，文化建设，公共文化信息共享，文化广电应急系统公共等服务',
    :content      => %{这里填写详细介绍})
  @cms_site.channels.create!(
    :parent_id    => ch_about.id,
    :title        => '联系我们',
    :short_title  => 'contact',
    :tmp_index    => 'temp_contact.html.erb',
    :tmp_detail   => 'temp_detail.html.erb',
    :keywords     => '联系我们，文广通，文体云，文化大数据，公共文化服务',
    :description  => '文广通提供文化活动推送，文化社团建设，文化广告等服务，欢迎联络',
    :content      => %{这里填写详细介绍})
  @cms_site.channels.create!(
    :parent_id    => ch_about.id,
    :title        => '使用帮助',
    :short_title  => 'help',
    :tmp_index    => 'temp_channel.html.erb',
    :tmp_detail   => 'temp_detail.html.erb',
    :keywords     => '使用帮助，文广通帮助说明，文体云，文化大数据，公共文化服务',
    :description  => '文广通提供文化活动，文化建设，公共文化信息共享，文化广电应急系统公共等服务',
    :content      => %{这里填写详细介绍})
  @cms_site.channels.create!(
    :parent_id    => ch_about.id,
    :title        => '社团入驻',
    :short_title  => 'submit-shetuan',
    :tmp_index    => 'temp_channel.html.erb',
    :tmp_detail   => 'temp_detail.html.erb',
    :keywords     => '社团入驻，文化社团，社团活动',
    :description  => '文广通提供社团系统建设，社团活动推送，社团文化广告等服务',
    :content      => %{这里填写详细介绍})
  @cms_site.channels.create!(
    :parent_id    => ch_about.id,
    :title        => '场馆入驻',
    :short_title  => 'submit-changguan',
    :tmp_index    => 'temp_channel.html.erb',
    :tmp_detail   => 'temp_detail.html.erb',
    :keywords     => '场馆入驻，文化场馆，场馆活动',
    :description  => '文广通提供场馆系统建设，场馆活动推送，场馆文化广告等服务',
    :content      => %{这里填写详细介绍})
  @cms_site.channels.create!(
    :parent_id    => ch_about.id,
    :title        => '剧院入驻',
    :short_title  => 'submit-juyuan',
    :tmp_index    => 'temp_channel.html.erb',
    :tmp_detail   => 'temp_detail.html.erb',
    :keywords     => '剧院入驻，文化剧院，剧院活动',
    :description  => '文广通提供剧院系统建设，剧院活动推送，剧院文化广告等服务',
    :content      => %{这里填写详细介绍})
  @cms_site.channels.create!(
    :parent_id    => ch_about.id,
    :title        => '图书馆入驻',
    :short_title  => 'submit-tushuguan',
    :tmp_index    => 'temp_channel.html.erb',
    :tmp_detail   => 'temp_detail.html.erb',
    :keywords     => '图书馆入驻，文化图书馆，图书馆活动',
    :description  => '文广通提供图书馆系统建设，图书馆活动推送，图书馆文化广告等服务',
    :content      => %{这里填写详细介绍})
  @cms_site.channels.create!(
    :parent_id    => ch_about.id,
    :title        => '文化馆入驻',
    :short_title  => 'submit-wenhuaguan',
    :tmp_index    => 'temp_channel.html.erb',
    :tmp_detail   => 'temp_detail.html.erb',
    :keywords     => '文化馆入驻，文化文化馆，文化馆活动',
    :description  => '文广通提供文化馆系统建设，文化馆活动推送，文化馆文化广告等服务',
    :content      => %{这里填写详细介绍})
