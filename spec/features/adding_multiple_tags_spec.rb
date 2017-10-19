feature 'Adding Tags 2.0' do
  scenario 'I want to add multiple tags to a link' do
    visit '/links/new'
    fill_in :url, with: 'www.zombo.com'
    fill_in :title, with: 'Zombocom'
    fill_in :tags, with: 'zombo, ainsley'
    click_button 'Create link'
    tags = Link.first(url: 'www.zombo.com').tags.map(&:name)
    expect(tags).to include 'zombo'
    expect(tags).to include 'ainsley'
  end
end
