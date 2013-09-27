require 'faker'

def seed_users
  9.times do
  	User.create(name:Faker::Name.name, email:Faker::Internet.free_email, password:"testing")	          
  	end
end



seed_users
