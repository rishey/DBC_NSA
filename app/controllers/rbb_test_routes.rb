get "/fill" do
	@user = User.last
	@survey = Survey.last
	@question = @survey.questions.last
	@choices = @question.choices
	erb :_multi_fill
end


post "/multi" do
p params
puts "HERE"
puts params[:question_id]
question = Question.find(params[:question_id].to_i)
choice = params[:question].to_i
response = Response.create(choice_id: choice, participant_id: params[:participant_id].to_i)
redirect "/"
end