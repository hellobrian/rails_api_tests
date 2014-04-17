require 'test_helper'

class CreatingGoalsTest < ActionDispatch::IntegrationTest

  setup { host! 'api.example.com' }

  test 'creates goals' do 
    post '/goals', 
    { goal: 
      { description: "my description", motivation: "my motivation", 
        completion_date: "2015-01-01", is_complete: false 
      }
    }.to_json, 
    { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type

    goal = json(response.body)
    assert_equal response.location, api_goal_url(goal[:id])
  end
end