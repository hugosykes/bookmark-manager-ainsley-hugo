feature 'Tags' do
  scenario 'I add a tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'www.googlie.com'
    fill_in 'title', with: 'Googlieasdf'
    fill_in 'tags', with: 'search engine'
    click_button 'Create link'

    link = Link.first(title: 'Googlieasdf')
    expect(link.tags.map(&:name)).to include 'search engine'
  end
end
