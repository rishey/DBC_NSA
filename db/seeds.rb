require 'faker'
10.times do
  Survey.create(name: Faker::Name.name, creator_id: 1) 
end


def seed_users
  10.times do
  	u = User.create(name:Faker::Name.name, email:Faker::Internet.free_email, password:"testing")	          
		 5.times do
		 		s = Survey.create(name: Faker::Company.bs)
		 		u.created_surveys << s
		 			6.times do
				 		question_text = Faker::Lorem.sentence + "?"
				 		q = Question.create(text: question_text)
				 				# each q has 4 choices
				 			4.times do
				 				c = Choice.create(choice: Faker::Company.bs)
				 				q.choices << c
				 			end
				 		s.questions << q
				 	end
		 	end
  end
end

def seed_responses
	200.times do
			u = User.all.sample
			c = Choice.all.sample
			r = Response.create(choice_id: c.id, participant_id: u.id)
	end
end


def seed_surveys
	Survey.all.each do |survey|
		uid = User.all.sample.id
		survey.questions.each do |question|
			choice = question.choices.last
			Response.create(choice_id: choice.id, participant_id: uid)
		end
	end
end
seed_users
seed_surveys


# seed_responses
