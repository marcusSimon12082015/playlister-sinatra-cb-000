require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/songs' do
    @songs = Song.all
    #binding.pry
    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :show
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :edit
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.update(artist: @artist, genres: params[:genres])
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

  post '/songs' do
    @artist = Artist.where("lower(name) = ?", params["Artist Name"].downcase)
    if @artist == []
        @artist = Artist.create(name: params["Artist Name"])
        @song = Song.find_or_create_by(name: params[:Name], artist: @artist)
    else
        @song = Song.find_or_create_by(name: params[:Name], artist: @artist.first)
    end
    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id.to_i)
    end
    #binding.pry
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end
end
