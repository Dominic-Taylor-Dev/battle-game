feature 'View hit points (HP)' do
  scenario 'HP on startup' do
    visit('/')
    fill_in :player_1_name, with: 'John'
    fill_in :player_2_name, with: 'Laura'
    click_button 'Submit'
    expect(page).to have_content 'Hit Points: 20/20'
  end
end