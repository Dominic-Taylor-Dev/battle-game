def sign_in_and_play
  visit('/')
  fill_in :player_1_name, with: 'John'
  fill_in :player_2_name, with: 'Laura'
  click_button 'Submit' #at this point you're on first battle page - either player could go first
end

def random_attack
  [attack_1, attack_2].sample
end

def attack_1
  click_button 'Clinical Hit'
end

def attack_2
  click_button 'Wild Swing'
end

def complete_game
  sign_in_and_play
  100.times { 
    if page.has_button?('attack_1')
      attack_1
    end
  }
end
