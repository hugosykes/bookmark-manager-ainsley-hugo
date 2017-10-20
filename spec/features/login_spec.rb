# feature 'Login' do
#   scenario 'I want to login and see my username on the homepage' do
#     visit '/'
#     fill_in :user, with: 'Hugo'
#     fill_in :password, with: 'hello'
#     click_button 'Submit'
#
#     expect(current_path).to eq '/links'
#
#     expect(page).to have_content 'Welcome, Hugo!'
#   end
# end
