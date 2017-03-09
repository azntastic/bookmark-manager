feature "Adding a tag" do
  scenario "The user can input the tag name, and will see the tag has been added" do
    visit '/links'
    click_button 'Add Link'
    fill_in :title, with: 'Makers Academy'
    fill_in :url, with: ('http://www.makersacademy.com/')
    fill_in :tag, with: ('Coding')
    click_button 'Save Link'
    expect(page).to have_content('Coding')
  end
end
