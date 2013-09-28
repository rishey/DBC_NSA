get '/' do
  
  erb :index
end

get '/survey/new' do
  if request.xhr?
    erb :_survey_form, layout: false
  else  
    erb :new_survey
  end
end


#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  @email = nil
  
  erb :sign_in
end

post '/sessions' do
  # sign-in
  @email = params[:email]
  user = User.authenticate(@email, params[:password])
  if user
    # successfully authenticated; set up session and redirect
    session[:user_id] = user.id
    redirect "/profile/#{session[:user_id]}"
  else
    # an error occurred, re-render the sign-in form, displaying an error
    @error = "Invalid email or password."
   redirect '/'
  end
end

delete '/sessions/:id' do
  # sign-out -- invoked via AJAX
  return 401 unless params[:id].to_i == session[:user_id].to_i
  session.clear
  200
end


#----------- USERS -----------


post '/users' do
  # sign-up
  @user = User.new params[:user]
  if @user.save
    # successfully created new account; set up the session and redirect
    session[:user_id] = @user.id
    redirect "/profile/#{session[:user_id]}"
  else
    # an error occurred, re-render the sign-up form, displaying errors
    redirect '/'
  end
end

get '/profile/:id' do
  user = User.find(params[:id])
  @created = user.created_surveys
   
   erb :profile
end
