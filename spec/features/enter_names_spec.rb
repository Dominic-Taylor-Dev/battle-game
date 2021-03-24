feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'PLAYER 1: John\nPLAYER 2: Laura'
  end
end