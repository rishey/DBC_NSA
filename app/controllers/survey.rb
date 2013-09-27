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
  puts "Hello"
  puts params[:survey]
  survey_id = params[:survey]
  survey = Survey.find(survey_id)
  survey.questions.each_with_index do |question, index|

    question.text = params[:question][:"text#{index+1}"]
    puts question.text
      question.responses.each_with_index do |response, index|
        puts params[:response][:"text#{index}"]
        response.text = params[:response][:"text#{index+1}"]
        puts response.text
      end
  end
end 
