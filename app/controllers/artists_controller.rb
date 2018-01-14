class ArtistsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/artists/") }

  get '/artists' do
    @artists = Artist.all
    #binding.pry
    erb :index
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    #binding.pry
    erb :show
  end

end
