#1. add default admin account
puts 'ROLES'
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by(name: role)
  puts 'role: ' << role
end

puts 'DEFAULT USERS'
user = User.create(:name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup)
puts 'user: ' << user.name
#user.confirm!
user.add_role :admin

user = User.create(:name => 'tanmer', :email => 'user@tanmer.com', :password => 'tanmer', :password_confirmation => 'tanmer')
puts 'user: ' << user.name
user.add_role :user

user = User.create(:name => 'meetiao', :email => 'user@meetiao.com', :password => 'meetiao', :password_confirmation => 'meetiao')
puts 'user: ' << user.name
user.add_role :user

user = User.create(:name => 'master', :email => 'master@inruby.com', :password => 'Kenrome', :password_confirmation => 'Kenrome')
puts 'user: ' << user.name
user.add_role :user
# 获取地图坐标：http://api.map.baidu.com/lbsapi/getpoint/index.html
Admin::Keystore.put('templete', 'met_llshg')
Admin::Keystore.put('site_name', '廖老四老火锅')
Admin::Keystore.put('site_short_name', '廖老四')
Admin::Keystore.put('contact_email', '666888@qq.com')
Admin::Keystore.put('firm_address', '成都龙湖三千星座2802')
Admin::Keystore.put('contact_mobile', '18080810818')
Admin::Keystore.put('contact_phone', '028-0228-0228')
Admin::Keystore.put('contact_qq', '666888')
Admin::Keystore.put('name', '廖老四老火锅')
Admin::Channel.create!(
  :parent_id    => nil,
  :typo         => 'article',
  :title        => '首页',
  :short_title  => 'index',
  :properties   => 1,
  :default_url  => nil,
  :tmp_index    => 'temp_index.html',
  :tmp_detail   => 'temp_detail.html',
  :keywords     => '德吉首页',
  :description  => '廖老四老火锅官网',
  :content      => ''
)
Admin::Channel.create!(
  :parent_id    => nil,
  :typo         => 'article',
  :title        => '关于廖老四',
  :short_title  => 'about',
  :properties   => 1,
  :default_url  => nil,
  :tmp_index    => 'temp_channel.html',
  :tmp_detail   => 'temp_detail.html',
  :keywords     => '关于廖老四',
  :description  => '廖老四老火锅，关于我们',
  :content      => ''
)
Admin::Channel.create!(
  :parent_id    => nil,
  :typo         => 'article',
  :title        => '招商加盟',
  :short_title  => 'zsjm',
  :properties   => 1,
  :default_url  => nil,
  :tmp_index    => 'temp_channel.html',
  :tmp_detail   => 'temp_detail.html',
  :keywords     => '廖老四招商加盟',
  :description  => '廖老四老火锅，招商加盟',
  :content      => ''
)
Admin::Channel.create!(
  :parent_id    => nil,
  :typo         => 'article',
  :title        => '分店风采',
  :short_title  => 'fdfc',
  :properties   => 1,
  :default_url  => nil,
  :tmp_index    => 'temp_list.html',
  :tmp_detail   => 'temp_detail.html',
  :keywords     => '廖老四分店风采',
  :description  => '廖老四老火锅，分店风采',
  :content      => ''
)
Admin::Channel.create!(
  :parent_id    => nil,
  :typo         => 'article',
  :title        => '特色菜品',
  :short_title  => 'tscp',
  :properties   => 1,
  :default_url  => nil,
  :tmp_index    => 'temp_list.html',
  :tmp_detail   => 'temp_detail.html',
  :keywords     => '廖老四特色菜品',
  :description  => '廖老四老火锅，特色菜品',
  :content      => ''
)
Admin::Channel.create!(
  :parent_id    => nil,
  :typo         => 'article',
  :title        => '新闻中心',
  :short_title  => 'news',
  :properties   => 1,
  :default_url  => nil,
  :tmp_index    => 'temp_list_news.html',
  :tmp_detail   => 'temp_detail.html',
  :keywords     => '廖老四新闻中心',
  :description  => '廖老四老火锅，新闻中心',
  :content      => ''
)
Admin::Channel.create!(
  :parent_id    => nil,
  :typo         => 'article',
  :title        => '联系我们',
  :short_title  => 'contact',
  :properties   => 1,
  :default_url  => nil,
  :tmp_index    => 'temp_contact.html',
  :tmp_detail   => 'temp_detail.html',
  :keywords     => '廖老四联系我们',
  :description  => '廖老四老火锅，联系我们',
  :content      => ''
)