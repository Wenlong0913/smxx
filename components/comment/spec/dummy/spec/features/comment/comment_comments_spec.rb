require 'rails_helper'

RSpec.feature "Comments", type: :feature, js: true do
  it 'post a comment' do
    create(:post, id: 1)
    visit '/posts/1'
    within("form") do
      fill_in 'comment[content]', with: 'hello, comment'
    end
    click_button '发表'
    sleep 1
    expect(Comment::Entry.last.content).to eq('hello, comment')
    expect(page).to have_content 'hello, comment'
  end
end
