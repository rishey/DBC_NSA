get "/stats" do
	@survey= Survey.first
	@questions = @survey.questions
	@completed_times =   @survey.responses.count / @survey.questions.count



	erb :stats
end