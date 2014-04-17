FactoryGirl.define do 
  factory :goal do 
    description "A description of my goal."
    motivation "Why am I trying to achieve this goal."
    completion_date "07/07/2015"
    is_complete false
  end
end