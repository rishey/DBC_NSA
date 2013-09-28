get "/fill" do
	@user = User.last
	@survey = Survey.last
	@question = @survey.questions.last
	@choices = @question.choices
	erb :_multi_fill
end


post "/multi" do
@survey = params[:survey_id]
puts questions = params[:question]

# Response.create()


# @survey.questions.each_with_index do |question, index|
#   question.choices.each_with_index do |choice|
#     question = Question.find

# question = Question.find(params[:question_id].to_i)
# choice = params[:question].to_i
# response = Response.create(choice_id: choice, participant_id: params[:participant_id].to_i)
# redirect "/"
end
