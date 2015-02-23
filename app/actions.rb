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
    @songs = Song.all
    @users = User.all
    erb :'users/index'
end

get '/users/new' do
    @songs = Song.all
    erb :'users/new'
end


post '/users/new' do
  @user = User.new(
    email: params[:email],
    name_first: params[:name_first],
    name_last: params[:name_last],
    password:  params[:password]
  )
  @user.save
  redirect '/songs/new'
end
