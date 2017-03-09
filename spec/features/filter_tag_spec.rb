# As a time-pressed user
# So that I can quickly find links on a particular topic
# I would like to filter links by tag

feature "filter by tag" do
  scenario "The user can view a list of links associated with requested tag" do
    link = Link.create(url: 'http://www.google.com', title: 'Google')
    tag = Tag.create(tag_name: 'bubbles')
    link.tags << tag
    link.save
    visit '/tags/bubbles'
    expect(page).to have_content('http://www.google.com')
  end

  scenario "user only presented with links associated with tag" do
    link = Link.create(url: 'http://www.twitter.com', title: 'twitter')
    tag = Tag.create(tag_name: 'bird')
    link.tags << tag
    link.save
    visit '/tags/bubbles'
    expect(page).to_not have_content('http://www.twitter.com')
  end
end
