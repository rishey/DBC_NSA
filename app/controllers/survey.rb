#  GETS #


get '/create_survey/:id' do
  @survey = Survey.find(params[:id])
  creator_id = 1
  puts @survey.creator_id
  puts session[:user_id]
  if @survey.creator_id == session[:user_id]
    erb :create_survey
  else
    redirect '/'
  end
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
        choice = Choice.create
        question.choices << choice
      end
      
      redirect "/create_survey/#{new_survey.id}"
    else
      redirect "/user_profile"
    end
end


post "/build_survey" do
  puts "Hello"
  puts params[:survey]
  survey_id = params[:survey]
  survey = Survey.find(survey_id)
  survey.questions.each_with_index do |question, index|
    Question.find(question.id).update_attributes(text: params[:question][:"text#{index+1}"])
      question.choices.each_with_index do |choice, index|
        Choice.find(choice.id).update_attributes(choice: params[:choice][:"choice#{index+1}"])        
      end
  end
end 
