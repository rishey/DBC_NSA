get "/fill" do
	@user = User.last
	@survey = Survey.last
	@question = @survey.questions.last
	@choices = @question.choices
	erb :_multi_fill
end


post "/multi" do
@survey = Survey.find(params[:survey_id].to_i)
@survey.questions.each_with_index do |question, index|
  Response.create(choice_id: params[:question][:"#{index}"], participant_id: session[:user_id])

end


# Response.create()


# @survey.questions.each_with_index do |question, index|
#   question.choices.each_with_index do |choice|
#     question = Question.find

# question = Question.find(params[:question_id].to_i)
# choice = params[:question].to_i
# response = Response.create(choice_id: choice, participant_id: params[:participant_id].to_i)
# redirect "/"
end
