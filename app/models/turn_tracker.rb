class TurnTracker
  def initialize(player_1, player_2)
    @players = [player_1, player_2]
    @current_player = @players.sample #randomized starting player
  end

  def current_player?
    @current_player
  end

  def next_player?
    @current_player == @players[0] ? @players[1] : @players[0]
  end

  def change_player
    if @current_player == @players[1]
      @current_player = @players[0]
    else
      @current_player = @players[1]
    end
  end
end
