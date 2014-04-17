require 'test_helper'

class ListingGoalsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }
  fixtures :goals

  test 'returns list of all goals' do
    get '/goals'
    assert_response :success
    refute_empty response.body
  end

  test 'returns goals filtered by is_complete' do 

    get '/goals?is_complete=true'
    assert_response :success

    goals_response = json(response.body)
    goals_list = goals_response.collect { |g| g[:is_complete] }
    assert_includes goals_list, true
    refute_includes goals_list, false
  end

  test 'returns goal by id' do 
    goal = goals(:one)
    get "/goals/#{goal.id}"
    assert_response :success

    goal_response = json(response.body)
    assert_equal goal.description, goal_response[:description]
  end

  test 'returns goals in JSON' do 
    get '/goals', {}, { 'Accept' => Mime::JSON }
    assert_response :success
    assert_equal Mime::JSON, response.content_type
  end

  # test 'returns list of goals in english' do
  #   get '/goals', {}, { 'Accept-Language' => 'en', 'Accept' => Mime::JSON }
  #   assert_equal 200, response.status
  #   goals = json(response.body)
  #   assert_equal "My first goal is: #{goals[0][:description]}!", goals[0][:message]
  # end

  # test 'returns goals in XML' do 
  #   get '/goals', {}, { 'Accept' => Mime::XML }
  #   assert_equal 200, response.status
  #   assert_equal Mime::XML, response.content_type
  # end
end