json.array!(@goals) do |goal|
  json.extract! goal, :id, :description, :motivation, :completion_date
  json.url goal_url(goal, format: :json)
end
