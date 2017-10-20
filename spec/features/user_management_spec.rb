feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    sign_up
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content 'Welcome, example@example.com'
    expect(User.first.email).to eq 'example@example.com'
  end
end
