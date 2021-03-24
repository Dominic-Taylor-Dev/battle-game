feature 'View hit points (HP)' do
  scenario 'HP on startup' do
    visit('/')
    sign_in_and_play
    expect(page).to have_content 'Hit Points: 20/20'
  end
end