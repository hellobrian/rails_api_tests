require 'test_helper'

class CreatingGoalsTest < ActionDispatch::IntegrationTest

  setup { 
    host! 'api.example.com' 
    @goal = build(:goal)
    @nil_goal = build(:goal, motivation: nil)
  }

  test 'creates goals' do 
    post '/goals', 
      @goal.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    goal = json(response.body)
    assert_equal response.location, api_goal_url(goal[:id])
  end

  test 'does not create goals with nil motivation' do 
    
    post '/goals', 
      @nil_goal.to_json,
      { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 422, response.status
    assert_equal Mime::JSON, response.content_type
  end
end