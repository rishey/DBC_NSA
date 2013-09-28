class Survey < ActiveRecord::Base
  belongs_to :creator, class_name: "User"
  has_many :participants, class_name: "User"
  has_many :questions
  has_many :choices, through: :questions
  has_many :responses, through: :choices
  has_many :participants, through: :responses

end
