feature 'Change turns' do
  before(:each) do
    sign_in_and_play
  end
  
  scenario 'Change turn after first move' do
    expected_player_message = "Current player (#{$game.turn_tracker.current_player?.name})"
    random_attack
    expect(page).to have_content("#{expected_player_message}")
  end

  scenario 'Change turn after subsequent moves (false negative poss. if game over reached before test)' do
    2.times { random_attack }
    expected_player_message = "Current player (#{$game.turn_tracker.next_player?.name})"
    random_attack
    expect(page).to have_content("#{expected_player_message}")
  end
end
