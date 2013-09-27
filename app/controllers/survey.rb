#  GETS #


get '/create_survey' do
  current_user = User.find(1)
  session[:user_id] = 1
  @survey = Survey.find(1)
  4.times do 
    @survey.questions << Question.new
  end
  @survey.questions.each do |question|
    4.times do 
      question.choices << Choice.create
    end
  end
  #   question = Question.create
  #     @survey.questions << question
  #       4.times do
  #         choice = Choice.create
  #         question.choices << choice
  #       end
  #   end
  erb :create_survey
end



# POSTS #

post "/new_survey" do 
  new_survey = Survey.create(params[:survey])
    if new_survey.valid? 
      @user = User.find(session[:user_id])
      num_questions = params[:num_questions]
      
      num_questions.times do 
        question = Question.create
        new_survey.questions << question
      end

      new_survey.questions.each do |question|
        choice = Choice.create
        question.choices << choice
      end
      
      redirect "/create_survey"
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
