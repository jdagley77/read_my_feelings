enable :sessions

get '/session/login' do
  erb :'session/new'
end

post '/session/login' do
  @user = User.authenticate(params[:user][:email],params[:user][:password])
  if @user
    login(@user)
    erb :index
  else
    @message = "Email or password is incorrect."
    erb :'/session/new'
  end
end

get '/session/logout' do
  session.delete(:user_id)
  redirect '/'
end