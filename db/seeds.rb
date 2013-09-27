require 'faker'

10.times do
  Survey.create(name: Faker::Name.name, creator_id: 1) 
end
