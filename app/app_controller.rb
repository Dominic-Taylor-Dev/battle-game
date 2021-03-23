require 'sinatra/base'
require 'sinatra/reloader'

class Controller < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :menu
  end

  post '/battle' do
    @player_1_name = params[:player_1_name]
    @player_2_name = params[:player_2_name]
    erb :battle
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end