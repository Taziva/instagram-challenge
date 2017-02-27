require 'rails_helper'

feature 'Can create posts' do
  background do
    visit '/'
    user = create(:user)
    sign_up_and_in
  end

  scenario 'by submitting pictures with captions' do
    visit '/'
    click_link 'Add Post'
    attach_file('post[image]', "spec/files/pictures/digital_spring.jpg")
    fill_in 'post[caption]', with: 'Digital Spring'
    click_button 'Create Post'
    expect(page).to have_content('Digital Spring')
    expect(page).to have_css("img[src*='digital_spring.jpg']")
  end
end
