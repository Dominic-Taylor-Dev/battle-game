require 'sinatra/base'
require 'sinatra/reloader'
require_relative './models/game'

class Controller < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  def load_game_state_easy_names
    @player_1_name = @game.player_1.name
    @player_1_avatar_front = @game.player_1.image_front
    @player_2_avatar_front = @game.player_2.image_front
    @player_1_avatar_back = @game.player_1.image_back
    @player_2_avatar_back = @game.player_2.image_back
    @player_2_name = @game.player_2.name
    @player_1_hp = @game.player_1.hitpoints
    @player_1_max_hp = @game.player_1.max_hp
    @player_2_hp = @game.player_2.hitpoints
    @player_2_max_hp = @game.player_2.max_hp
    @current_player_hp = @game.turn_tracker.current_player?.hitpoints
    @current_player_hp_max = @game.turn_tracker.current_player?.max_hp
    @next_player_hp = @game.turn_tracker.next_player?.hitpoints
    @next_player_hp_max = @game.turn_tracker.next_player?.max_hp
    @current_player = @game.turn_tracker.current_player?.name.name
    @next_player = @game.turn_tracker.next_player?.name.name
  end

  enable :sessions # needed to pass attack choice params between /next-turn and /attack

  get '/' do
    erb :index
  end

  post '/form_store' do
    player_1 = Player.new(params[:player_1_name]) # this info will be needed for Game's initialize
    player_2 = Player.new(params[:player_2_name])
    @game = Game.create(player_1, player_2) # uses class method 'create', not with player names as the initialize method would, but with player instances
    redirect '/battle'
  end

  before do # @game is here not a 'normal' instance variable but a class instance variable
    @game = Game.instance
    load_game_state_easy_names
  end

  get '/battle' do
    erb :battle
  end

  post '/attack' do
    p "post /attack is being run"
    if @game.game_over?
      erb :game_over
    elsif params[:attack_type] # allows attack_type to be taken either as a param (from the index form) or as a session variable having been set up in /next-turn
      session[:attack_type] = params[:attack_type]
      p "the session is being set"
    end
    @game.attack(session[:attack_type])
    erb :attack_result
  end

  post '/next-turn' do
    @game.next_turn
    session[:attack_type] = params['attack_type']
    redirect '/attack', 307 # 307 makes it a POST request as redirect defaults to get
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
