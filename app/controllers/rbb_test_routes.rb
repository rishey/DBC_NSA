get "/fill" do

	@survey = Survey.last
	@question = @survey.questions.last
	@choices = @question.choices
	erb :_multi_fill
end


post "/multi" do
	

end