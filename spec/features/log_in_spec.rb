
feature 'sign up' do
  scenario "user signs up" do
    visit '/'
    click_button 'Sign up'
    fill_in 'Email', with: ('jimmy@timmy.co.uk')
    fill_in 'Password', with: ('timmysucks')
    click_button 'Submit'
    expect(current_path).to eq '/links'
    expect(page).to have_content 'Welcome jimmy@timmy.co.uk'
    expect(subject.users.count).to eq 1
    # expect(users.first).to eq users.last
  end


end
