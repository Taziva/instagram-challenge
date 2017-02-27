def sign_up_and_in
   visit('/')
   fill_in('Email', with: 'test@example.com')
   fill_in('Password', with: 'testtest')
   click_button('Log in')
 end
