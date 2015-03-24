enable :session
require 'sinatra/flash'

get '/' do
  @username = request.cookies["email"]
  @songs = Song.all
  erb :'index'
end

get '/songs' do
    @username = request.cookies["email"] 
    @user = User.where(email: @username)
    @id = @user[0].id if @username
    @users = User.all
    @songs = Song.all
    erb :'songs/index'
end

post '/songs' do
  @username = request.cookies["email"] 
  @user = User.where(email: @username)
  @id = @user[0].id
  @rating = Rating.new(user_id: @id, song_id: params[:song_id])
  @rating.save
  redirect '/songs'
end

get '/songs/new' do
    @errors = flash[:errors]
    @username = request.cookies["email"] 
    @songs = Song.all
    erb :'songs/new'
end

post '/songs/new' do
  @username = request.cookies["email"] 
  @user = User.where(email: @username)
  @id = @user[0].id
  @errors = session[:errors]
  @song = Song.new(
    title: params[:title],
    url: params[:url],
    author:  params[:author],
    user_id: @id
  )
  if @song.save
    redirect("/songs")
    session.delete(:errors)
  else
    flash[:errors] = @song.errors.values.map{|e| e.to_s}
    redirect('/songs/new')
  end
end

get '/users' do
    @songs = Song.all
    @users = User.all
    erb :'users/index'
end

get '/users/new' do
  @errors = flash[:errors]
  @username = request.cookies["email"]
  @songs = Song.all
  if @username
    erb :'users/welcome'
  else
    erb :'users/new'
  end
end

post '/users/new' do
  @user = User.new(
    email: params[:email],
    name_first: params[:name_first],
    name_last: params[:name_last],
    password:  params[:password]
  )
  @user.save
  if @user.save
    response.set_cookie("email", :value => params[:email], :path => "/", :expires => Time.now + 60*60*24*365*3)
    session.delete(:errors)
    redirect("/songs")
  else
    flash[:errors] = @user.errors.values.map{|e| e.to_s}
    redirect('/users/new')
  end
  
end

get '/users/logout' do   
  response.set_cookie("email", :value => "", :path => "/", :expires => Time.now - 86400000)
  redirect '/'
end

post '/users/login' do
  params[:email]
  params[:password]
  users = User.where(email: params[:email]).where(password: params[:password])
  if users.count > 0
    user = users[0]
    response.set_cookie("email", :value => params[:email], :path => "/", :expires => Time.now + 60*60*24*365*3)
    redirect '/songs'
  else
    # login failed
    redirect '/?message=Failed'
  end
end

get '/users/login' do
  erb :'users/login'
end








