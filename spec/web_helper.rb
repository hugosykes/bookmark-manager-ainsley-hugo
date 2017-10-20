def sign_up
  visit '/users/new'
  fill_in :email, with: 'example@example.com'
  fill_in :password, with: 'hello'
  click_button 'Sign up'
end
