get '/' do
  @username = request.cookies["email"]
  @songs = Song.all
  erb :'index'
end


get '/songs' do
    User.joins(:songs)
    @users = User.all
    @songs = Song.all
    erb :'songs/index'
end


get '/songs/new' do



    @username = request.cookies["email"] 

    @songs = Song.all
    erb :'songs/new'
end


post '/songs/new' do



   @username = request.cookies["email"] 

  @user = User.where(email: @username)

  @id = @user[0].id

  @song = Song.new(
    title: params[:title],
    url: params[:url],
    author:  params[:author],
    user_id: @id
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
  @username = request.cookies["email"]
  @songs = Song.all

  if@username
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

  response.set_cookie("email", :value => params[:email], :path => "/", :expires => Time.now + 60*60*24*365*3)


  redirect '/users/new'
end

get '/users/logout' do  
  
  response.set_cookie("email", :value => "", :path => "/", :expires => Time.now - 86400000)
    redirect '/'
  redirect '/users/new'


end






