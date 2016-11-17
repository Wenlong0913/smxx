require 'rails_helper'

RSpec.feature "Admin::SignIns", type: :feature, js: true do
  let(:user) { create(:user) }
  it 'login in with mobile and code' do
    user_mobile = create(:user_mobile, user_id: user.id)
    visit admin_sign_in_path
    click_on '手机号登陆'
    fill_in 'user[mobile]', with: user_mobile.phone_number
    click_on '获取验证码'
    expect(page).to have_content '验证码发送成功'
    fill_in 'user[code]', with: '1234'
    find('input[type="submit"]').click
    # page.save_screenshot 'admin_sign_in.png'
    expect(page).to have_content '你好'
  end
end
