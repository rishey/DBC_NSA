#  GETS #


get '/create_survey' do
  current_user = User.find(1)
  session[:user_id] = 1
  @survey = Survey.find(1)
  erb :create_survey
end



# POSTS #

post "/new_survey" do 
  new_survey = Survey.create(params[:survey])
    if new_survey.valid? 
      session[:survey_id] = new_survey.id
      num_questions = params[:num_questions]
        num_questions.times do 
          question = Question.create
          new_survey.questions << question
            4.times do
              response = Response.create
              question.responses << response
            end
        end
        redirect "/create_survey"
    else
      redirect "/user_profile"
    end
end


post "/build_survey" do
  survey_id = session[:survey_id]
  survey = Survey.find(survey_id)
  survey.questions.each_with_index do |question, index|
    question.text = params[:question][:text+"#{index}"]
      question.responses.each do |response|
        response.text = params[:question][:response][:text]
      end
  end
end 
