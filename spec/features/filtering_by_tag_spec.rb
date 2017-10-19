feature 'Filtering by tag' do
  scenario 'I want to see links with the associated tag' do
    visit '/links/new'

    fill_in :url, with: 'www.bleugh.com'
    fill_in :title, with: 'bleugh'
    fill_in :tags, with: 'bubbles'
    click_button 'Create link'

    visit '/links/new'

    fill_in :url, with: 'www.asdf.com'
    fill_in :title, with: 'bleugh'
    fill_in :tags, with: 'google'
    click_button 'Create link'

    visit '/tags/bubbles'

    expect(page).to have_content 'www.bleugh.com'
    expect(page).to_not have_content 'www.asdf.com'
  end
end
