class Goal < ActiveRecord::Base
  validates :description, :motivation, presence: true
end
