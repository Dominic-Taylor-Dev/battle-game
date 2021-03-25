feature 'View hit points (HP)' do
  before(:each) do
    sign_in_and_play
  end
  scenario 'Full HP on startup' do
    expect(page).to have_content '60 / 60'
  end

  scenario 'Player 1 able to view up-to-date HP during game' do
    2.times { random_attack }
    expect(page).to have_content "#{$game.player_1.hitpoints} / #{$game.player_1.max_hp}"
  end
end
