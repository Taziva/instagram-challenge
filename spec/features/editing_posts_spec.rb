require 'rails_helper'

feature 'Can edit posts' do
  background do
    visit '/'
    user = create(:user)
    sign_up_and_in
    post = create(:post, user:user)
  end

  scenario 'throught the edit button' do
    visit '/'
    find(:xpath, "//a/img[@alt='Digital spring']/..").click
    click_link 'Edit'
    fill_in 'post[caption]', with: 'It is still winter...'
    click_button 'Update Post'
    expect(page).to have_content('Post updated.')
    expect(page).to have_content('It is still winter...')
  end
end
