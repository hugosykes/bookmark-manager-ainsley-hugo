feature 'Filtering by tag' do
  scenario 'I want to see links with the associated tag' do
    Link.create(url: 'www.bleugh.com', title: 'Google', tags: [Tag.first_or_create(name: 'bubble')])
    Link.create(url: 'www.googlie.com', title: 'Google', tags: [Tag.first_or_create(name: 'babble')])
    visit '/tag/bubble'
    within 'ul#links' do
      expect(page).to have_content 'www.bleugh.com'
      expect(page).to_not have_content 'www.googlie.com'
    end
  end
end
