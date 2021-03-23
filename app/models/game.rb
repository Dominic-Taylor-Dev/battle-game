require_relative './player'
require_relative './turn_tracker'

class Game
  attr_reader :player_1, :player_2, :turn_tracker
  
  def initialize(player_1_name, player_2_name)
    @player_1 = Player.new(player_1_name)
    @player_2 = Player.new(player_2_name)
    @turn_tracker = TurnTracker.new(@player_1, @player_2)
    # @current_player = turn_tracker.current_player
  end

  def next_turn
    turn_tracker.next_turn
  end

  def attack
    turn_tracker.next_player?.take_damage # which changes the player instance's hitpoints and returns nothing
  end

  def game_over?
    turn_tracker.current_player?.hitpoints <= 0
  end
end
