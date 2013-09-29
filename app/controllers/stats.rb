require 'gchart'
get "/stats/survey/:survey_id" do
	@survey= Survey.find(params[:survey_id])
	@questions = @survey.questions
	@completed_times =   @survey.responses.count / @survey.questions.count
	erb :stats
end



