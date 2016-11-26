# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

%w(admin agent).each do |name|
  Role.find_or_create_by name: name
end

_, admin = User::Create.(mobile_phone: '15328077520', nickname: '管理员', password: 'abcd1234')
_, agent = User::Create.(mobile_phone: '15328077521', nickname: '商家', password: 'abcd1234')
_, user = User::Create.(mobile_phone: '15328077522', nickname: '用户', password: 'abcd1234')

admin.add_role :admin
agent.add_role :agent
