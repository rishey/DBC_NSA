class Choice < ActiveRecord::Base
  belongs_to :question
  has_one :survey, through: :question
  has_many :responses

end
