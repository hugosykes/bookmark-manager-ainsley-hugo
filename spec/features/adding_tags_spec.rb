
feature 'Tags' do
  scenario 'I add a tag to a link' do
    Link.create(url: 'www.googlie.com', title: 'Google', tags: [Tag.first_or_create(name: 'search engine')])
    link = Link.first(title: 'Google')
    expect(link.tags.map(&:name)).to include 'search engine'
  end
end
