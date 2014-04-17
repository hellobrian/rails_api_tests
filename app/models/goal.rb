class Goal < ActiveRecord::Base
  validates :motivation, presence: true
end
