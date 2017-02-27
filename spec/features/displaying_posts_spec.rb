require 'rails_helper'

feature 'Can display posts' do
  background do
    visit '/'
    user = create(:user)
    sign_up_and_in
    post1 = create(:post, caption: "Posting for the first time", user:user)
    post2 = create(:post, caption: "it's tedious the second time", user:user)
  end

  scenario 'on the index page' do
    visit '/'
    expect(page).to have_content("Posting for the first time")
    expect(page).to have_content("it's tedious the second time")
    expect(page).to have_css("img[alt='Digital spring']")
  end
end
