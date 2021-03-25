feature 'Game Over screen' do
  scenario 'A win message is visible' do
    complete_game
    expect(page).to have_content 'won!!!'
  end

  scenario 'A lose message is visible' do
    complete_game
    expect(page).to have_content 'lost!!!'
  end

  scenario 'The correct loser is displayed' do
    complete_game
    if $game.player_1.hitpoints == 0
      expect(page).to have_content 'John lost!!!'
    else
      expect(page).to have_content 'Laura lost!!!'
    end
  end
end
