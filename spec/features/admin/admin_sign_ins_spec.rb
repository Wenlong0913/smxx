require 'rails_helper'

RSpec.feature "Admin::SignIns", type: :feature, js: true do
  let(:user) { create(:user) }
  scenario 'login in with mobile and code' do
    user_mobile = create(:user_mobile, user_id: user.id)
    user.add_role :admin
    visit admin_sign_in_path
    click_on '手机号登陆'
    fill_in 'user[mobile]', with: user_mobile.phone_number
    find('.get_code').click
    expect(page).to have_content '验证码发送成功'
    fill_in 'user[code]', with: '1234'
    find('input[type="submit"]').click
    # page.save_screenshot 'admin_sign_in.png'
    expect(page).to have_content '退出系统'
  end
end
