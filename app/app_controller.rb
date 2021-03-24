require 'sinatra/base'
require 'sinatra/reloader'
require_relative './models/game'

class Controller < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions # needed to ensure persistence of player names

  def load_easy_names
    @player_1_name = $game.player_1.name
    @player_2_name = $game.player_2.name
    @player_1_hp = $game.player_1.hitpoints
    @player_1_max_hp = $game.player_1.max_hp
    @player_2_hp = $game.player_2.hitpoints
    @player_2_max_hp = $game.player_2.max_hp
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
    load_easy_names
    erb :battle #trying to work out how to merge - atm just battle should be there but considered trying to get a persistent header in a different erb file
  end

  post '/attack' do
    if $game.game_over?
      erb :game_over
    else
      attack_type = params[:attack_type] 
      $game.attack(attack_type)
      load_easy_names
      erb :attack_result
    end
  end

  post '/next-attack' do
    $game.next_turn
    attack_type = params[:attack_type] # still needs something to take parameters from battle.erb
    $game.attack(attack_type)
    load_easy_names
    if $game.game_over?
      erb :game_over
    else
      erb :attack_result
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
