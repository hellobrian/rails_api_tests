require 'test_helper'

class ListingGoalsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'returns list of all goals' do
    get '/goals'
    assert_equal 200, response.status
    refute_empty response.body
  end

  test 'returns goals filtered by is_complete' do 
    goal1 = goals(:one)
    goal2 = goals(:two)

    get '/goals?is_complete=true'
    assert_equal 200, response.status

    goals_response = json(response.body)
    goals_list = goals_response.collect { |g| g[:is_complete] }
    assert_includes goals_list, true
    refute_includes goals_list, false
  end

  test 'returns goal by id' do 
    goal1 = goals(:one)
    get "/goals/#{goal1.id}"
    assert_equal 200, response.status

    goal_response = json(response.body)
    assert_equal goal1.description, goal_response[:description]
  end
end