feature 'Attack' do
  before(:each) do
    sign_in_and_play
  end

  scenario 'Get confirmation of attack' do    
    attack_1
    page.should(satisfy do |page|
      page.has_content?('John HIT Laura') || page.has_content?('Laura HIT John')
    end)
  end

  scenario 'Attack 1 (clinical hit) reduces opponent HP by 10' do    
    expect { attack_1 }.to change { $game.turn_tracker.next_player?.hitpoints }.by(-10)
  end

  scenario 'Attack 2 (wild swing) reduces opponent HP by between 5 and 20' do    
    expect { attack_2 }.to change { $game.turn_tracker.next_player?.hitpoints }.by_at_most(-5)
    expect { attack_2 }.to change { $game.turn_tracker.next_player?.hitpoints }.by_at_least(-20)
  end
end
