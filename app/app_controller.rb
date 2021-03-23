require 'sinatra/base'
require 'sinatra/reloader'
require_relative './models/game'

class Controller < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions # needed to ensure persistence of player names

  def load_easy_names
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    @player_1_hp = $game.player_1.hitpoints
    @player_1_max_hp = $game.player_1.max_hp
    @player_2_hp = $game.player_2.hitpoints
    @player_2_max_hp = $game.player_2.max_hp
    @current_player = $game.turn_tracker.current_player?.name
    @next_player = $game.turn_tracker.next_player?.name
  end

  def display_attack_result
    if $game.game_over?
      erb :game_over
    else
      erb :attack_result
    end
  end

  get '/' do
    erb :index
  end

  post '/form_store' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    $game = Game.new(params[:player_1_name], params[:player_2_name])
    redirect '/battle'
  end

  get '/battle' do
    load_easy_names
    erb :battle #trying to work out how to merge - atm just battle should be there but considered trying to get a persistent header
  end

  post '/attack' do
    $game.attack
    load_easy_names
    display_attack_result
  end

  post '/next-attack' do
    $game.next_turn
    $game.attack
    load_easy_names
    display_attack_result
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
