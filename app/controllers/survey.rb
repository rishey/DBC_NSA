#  GETS #


get '/create_survey/:id' do
  @survey = Survey.find(params[:id])

  if @survey.creator_id == session[:user_id]
    erb :create_survey
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

# POSTS #

post "/survey/new" do 
  new_survey = Survey.create(name: params[:survey])
    if new_survey.valid? 
      @user = User.find(session[:user_id])
      @user.created_surveys << new_survey
      num_questions = params[:num_questions].to_i
      
      num_questions.times do 
        question = Question.create
        new_survey.questions << question
      end

      new_survey.questions.each do |question|
        4.times do
          choice = Choice.create
          question.choices << choice
        end
      end
      
      redirect "/create_survey/#{new_survey.id}"
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
