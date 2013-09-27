#  GETS #







# POSTS #

# post "/new_survey" do 
#   new_survey = Survey.create(params[:survey])
#     if new_survey.valid? 
#       session[:survey_id] = new_survey.id
#       num_questions = params[:num_questions]
#         num_questions.times do 
#           question = Question.create
#           new_survey.questions << question
#             4.times
#               response = Response.create
#               question.responses << response
#             end
#         end
#         redirect "/create_survey"
#     else
#       redirect "/user_profile"
#     end
# end


# post "/build_survey" do
#   survey_id = session[:survey_id]
#   survey = Survey.find(survey_id)
#   survey.questions.each do |question|
#     question.
#   end
# end 
