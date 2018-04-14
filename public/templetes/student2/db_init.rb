@cms_site.keystores.find_or_create_by(key:'site_name', value: '市民报名学校系统')
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
    :tmp_detail   => 'temp_details.html.erb',
    :keywords     => '市民报名学校系统',
    :description  => '市民报名学校系统',
    :content      => %{nil})
  
@cms_site.channels.create!(
    :parent_id    => nil,
    :title        => '课程详情',
    :short_title  => 'table',
    :tmp_index    => 'temp_table.html.erb',
    :tmp_detail   => 'temp_table.html.erb',
    :keywords     => '市民报名学校系统',
    :description  => '市民报名学校系统',
    :content      => %{nil})
  
  #关于我们、联系我们、场馆入驻、使用帮助
@cms_site.channels.create!(
    :parent_id    => nil,
    :title        => '个人选课情况',
    :short_title  => 'forms',
    :tmp_index    => 'temp_forms.html.erb',
    :tmp_detail   => 'temp_forms.html.erb',
    :keywords     => '市民报名学校系统',
    :description  => '市民报名学校系统',
    :content      => %{nil})

@cms_site.channels.create!(
    :parent_id    => nil,
    :title        => '课程表',
    :short_title  => 'blank',
    :tmp_index    => 'temp_blank.html.erb',
    :tmp_detail   => 'temp_blank.html.erb',
    :keywords     => '市民报名学校系统',
    :description  => '市民报名学校系统',
    :content      => %{nil})


