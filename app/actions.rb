get '/songs' do
    @songs = Song.all
    erb :'songs/index'
end


get '/songs/new' do
    @songs = Song.all
    erb :'songs/new'
end
