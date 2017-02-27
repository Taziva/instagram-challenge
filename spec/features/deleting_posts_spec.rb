feature 'Can delete posts' do
  background do
    visit '/'
    user = create(:user)
    sign_up_and_in
    post = create(:post, caption: 'Digital Spring', user:user)
  end

  scenario 'via dedicated individual link.' do
    visit '/'
    find(:xpath, "//a/img[@alt='Digital spring']/..").click
    click_link 'Edit'
    click_link 'Delete Post'
    expect(page).to_not have_content('Digital Spring')
    expect(page).to_not have_css("img[alt='Digital spring']")
  end
end
