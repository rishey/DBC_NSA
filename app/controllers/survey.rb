#  GETS #


get '/create_survey/:id' do
  @survey = Survey.find(params[:id])

  if @survey.creator_id == session[:user_id]
    erb :_create_survey
  else
    redirect '/'
  end
end

get '/survey/admin/:id' do
  @survey = Survey.find(params[:id].to_i)
  if @survey.creator_id == session[:user_id]
    erb :survey_admin
  else
    redirect '/'
  end
end

get '/survey/:id' do
  @survey = Survey.find(params[:id].to_i)
  erb :participant_survey
end

get '/survey/completed/:id' do
  @survey = Survey.find(params[:id].to_i)
  @user = User.find(session[:user_id])
  erb :survey_complete
end

# POSTS #

post "/survey/new" do 
  @survey = Survey.create(name: params[:survey])
    if @survey.valid? 
      @user = User.find(session[:user_id])
      @user.created_surveys << @survey
      num_questions = params[:num_questions].to_i
      
      num_questions.times do 
        question = Question.create
        @survey.questions << question
      end

      @survey.questions.each do |question|
        4.times do
          choice = Choice.create
          question.choices << choice
        end
      end
      
      if request.accept?
        erb :_build_survey, layout: false
      else
        redirect "/_build_survey/#{@survey.id}"
      end
    
    else
      redirect "/user_profile"
    end
end


post "/build_survey" do
  survey_id = params[:survey]
  survey = Survey.find(survey_id)
  survey.questions.each_with_index do |question, index|
    question.update_attributes(text: params[:question][:"text#{index}"])
    
    question.choices.each_with_index do |choice, index2|
      choice.update_attributes(choice: params[:"response#{index}"][:"choice#{index2}"])        
    end
  end
  redirect "/survey/admin/#{survey.id}"
end 


post "/participant_submit" do
  @survey = Survey.find(params[:survey_id].to_i)
  @survey.questions.each_with_index do |question, index|
    response = Response.create(choice_id: params[:question][:"#{index}"], participant_id: session[:user_id])
      redirect "/survey/#{@survey.id}" if !response.valid?
    end
  redirect "/survey/completed/#{@survey.id}"
end

