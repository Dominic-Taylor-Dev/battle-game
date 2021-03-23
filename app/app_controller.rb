require 'sinatra/base'
require 'sinatra/reloader'
require_relative './models/game'

class Controller < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  enable :sessions
  
  get '/' do
    erb :index
  end

  post '/form_store' do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    redirect '/battle'
  end

  get '/battle' do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    $game = Game.new(@player_1_name, @player_2_name) # not sure about this??
    @player_1_hp = $game.player_1.hitpoints
    @player_2_hp = $game.player_2.hitpoints
    @current_player = $game.turn_tracker.current_player?.name
    erb :battle
  end

  post '/attack' do
    $game.attack
    @current_player = $game.turn_tracker.current_player?.name
    @previous_player = $game.turn_tracker.next_player?.name
    @player_1_hp = $game.player_1.hitpoints
    @player_2_hp = $game.player_2.hitpoints
    if $game.game_over?
      erb :game_over
    else
      erb :attack_result
    end
  end

  post '/battle' do
    $game.next_turn
    $game.attack
    @current_player = $game.turn_tracker.current_player?.name
    @previous_player = $game.turn_tracker.next_player?.name
    @player_1_hp = $game.player_1.hitpoints
    @player_2_hp = $game.player_2.hitpoints
    if $game.game_over?
      erb :game_over
    else
      erb :attack_result
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
