feature 'Submits a new link' do
  scenario 'I want add the site address' do
    visit '/links/new'
    num = rand(1_000_000).to_s
    fill_in 'url', with: "www.#{num}.com"
    fill_in 'title', with: num
    click_button 'Create link'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content num
    end
  end
end
