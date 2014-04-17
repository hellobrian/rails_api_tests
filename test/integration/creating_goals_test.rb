require 'test_helper'

class CreatingGoalsTest < ActionDispatch::IntegrationTest

  setup { 
    host! 'api.example.com' 
    # @empty_goal = goals(:empty)
    # @nil_goal = goals(:nil)
    # @goal = goals(:one)
  }

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

  # test 'does not create goals with nil fields' do 
  #   post '/goals', 
  #   { goal: 
  #     { description: nil, motivation: nil, 
  #       completion_date: nil, is_complete: nil 
  #     }
  #   }
  # end
end