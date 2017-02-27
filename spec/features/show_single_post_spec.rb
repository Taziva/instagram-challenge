require 'rails_helper'

feature 'Show page for a single post works' do
  background do
    visit '/'
    @user = create(:user)
    sign_up_and_in
  end
  scenario 'when a picture is clicked on' do
    post = create(:post, user:@user)
    visit '/'
    find(:xpath, "//a/img[@alt='Digital spring']/..").click
    expect(page.current_path).to eq(post_path(post))
  end
end
