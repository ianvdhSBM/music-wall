helpers do
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
end

# Homepage (Root path)
get '/' do
  @user = current_user
  erb :index
end

get '/songs' do
  @songs = Song.all
  @users = User.all
  # binding.pry
  erb :'songs/index'
end

get '/songs/new' do
  if current_user.nil?
    redirect '/users/login'
  else
    @song = Song.new
    erb :'songs/new'
  end
end

get '/users/new' do
  @user = User.new
  erb :'users/new'
end

post '/users' do
  @user = User.new(
    username: params[:username],
    password: params[:password]
  )
  if @user.save
    redirect '/songs'
  else
    erb :'users/new'
  end
end

get '/users/login' do
  erb :'users/login'
end

get '/users/logout' do
  session[:user_id] = nil
  redirect '/songs'
end

post '/users/login' do
  user = User.find_by(username: params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect '/songs'
  else
    erb :'users/login'
  end
end

get '/songs/mysongs' do
  @mysongs = Song.where(user_id: current_user.id)
  erb :'songs/mysongs'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  @songs_from_artist = Song.where(author: @song.author).where.not(id: @song.id)
  erb :'songs/show'
end 

post '/songs' do
  @song = Song.new(
    title: params[:title],
    author: params[:author],
    url: params[:url],
    created_at: params[:created_at],
    updated_at: params[:updated_at]
    )
  @song.user_id = current_user.id
  if @song.save
    redirect '/songs'
  else
    erb :'/songs/new'
  end
end

post '/songs/upvote' do
  @upvote = Upvote.find_or_create_by(
    song_id: params[:song_id],
    user_id: current_user.id
    )

  redirect '/songs'
end






