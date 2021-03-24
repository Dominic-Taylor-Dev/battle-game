require 'sinatra/base'
require 'sinatra/reloader'
require_relative './models/game'

class Controller < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  # Needed originally to ensure persistence of player names. 
  # Although not being used here as storing in a global variable
  # ($game), still keeping for my own future reference on similar projects
  # enable :sessions 

  def load_game_state_easy_names
    @player_1_name = $game.player_1.name
    @player_1_avatar_front = $game.player_1.image_front
    @player_2_avatar_front = $game.player_2.image_front
    @player_1_avatar_back = $game.player_1.image_back
    @player_2_avatar_back = $game.player_2.image_back
    @player_2_name = $game.player_2.name
    @player_1_hp = $game.player_1.hitpoints
    @player_1_max_hp = $game.player_1.max_hp
    @player_2_hp = $game.player_2.hitpoints
    @player_2_max_hp = $game.player_2.max_hp
    @current_player_hp = $game.turn_tracker.current_player?.hitpoints
    @current_player_hp_max = $game.turn_tracker.current_player?.max_hp
    @next_player_hp = $game.turn_tracker.next_player?.hitpoints
    @next_player_hp_max = $game.turn_tracker.next_player?.max_hp
    @current_player = $game.turn_tracker.current_player?.name
    @next_player = $game.turn_tracker.next_player?.name
  end

  get '/' do
    erb :index
  end

  post '/form_store' do
    $game = Game.new(params[:player_1_name], params[:player_2_name]) # global variables are bad...!
    redirect '/battle'
  end

  get '/battle' do
    load_game_state_easy_names
    erb :battle
  end

  post '/attack' do
    if $game.game_over?
      erb :game_over
    else
      attack_type = params[:attack_type] 
      $game.attack(attack_type)
      load_game_state_easy_names
      erb :attack_result
    end
  end

  post '/next-attack' do
    $game.next_turn
    attack_type = params[:attack_type] # still needs something to take parameters from battle.erb
    $game.attack(attack_type)
    load_game_state_easy_names
    if $game.game_over?
      erb :game_over
    else
      erb :attack_result
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
