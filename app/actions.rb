get '/' do
  @songs = Song.all
  erb :'index'
end


get '/songs' do
    @songs = Song.all
    erb :'songs/index'
end


get '/songs/new' do
    @songs = Song.all
    erb :'songs/new'
end


post '/songs/new' do
  @song = Song.new(
    title: params[:title],
    url: params[:url],
    author:  params[:author]
  )
  @song.save
  redirect '/songs'
end

get '/users' do
    @users = User.all
    erb :'users/index'
end


get '/users/new' do
    @users = User.all
    erb :'users/new'
end