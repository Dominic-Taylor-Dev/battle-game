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

  def self.create(player_1, player_2) 
    @game = Game.new(player_1, player_2) # call initialize on self and store it as a class instance variable
  end
  
  def self.instance
    @game # return the class instance variable @game
  end

  def next_turn
    @turn_tracker.change_player
  end

  def attack(attack_type)
    @turn_tracker.next_player?.take_damage(attack_type)
  end

  def game_over?
    @turn_tracker.next_player?.hitpoints <= 0
  end
end
