class Response < ActiveRecord::Base
  belongs_to :choice
  has_one :question, through: :choice
  belongs_to :participant, class_name: "User"
end
