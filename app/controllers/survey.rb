#  GETS #







# POSTS #

post "/new_survey" do 
  new_survey = Survey.create(params[:survey])
    if new_survey.valid? 
      session[:survey_id] = new_survey.id

    else
    end

  redirect "create_survey"
end
