class TurnTracker
  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
   end

  def current_player?
    @current_player
  end

  def next_player?
    @current_player == @player_1 ? @player_2 : @player_1 # these locations in the array are players 1 and 2 respectively
  end

  def next_turn
    if @current_player == @player_1
      @current_player = @player_2
    end
  end
end