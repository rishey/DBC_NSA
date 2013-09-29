require 'gchart'
get "/stats/survey/:survey_id" do
	@survey= Survey.find(params[:survey_id])
	@questions = @survey.questions
	@completed_times =   @survey.responses.count / @survey.questions.count
	@graph_choices=[]
	@graph_choice_nums=[]

	# make graph data hopefully:
@questions.each do |question|
	question.choices.each do |choice|
		@graph_choices << choice.choice
		@graph_choice_nums << choice.responses.count
	end
@chart = Gchart.pie_3d(title: @survey.name , size: '400x200', data: @graph_choice_nums, labels: @graph_choices ) 
puts @survey_name
puts @graph_choice_nums
puts @graph_choices
 # puts Gchart.pie_3d(title: @survey.name , size: '400x200', data: @graph_choice_nums, labels: @graph_choices ) 
end


	erb :stats
end



