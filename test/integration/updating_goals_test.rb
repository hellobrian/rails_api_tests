require 'test_helper'

class UpdatingGoalsTest < ActionDispatch::IntegrationTest
  setup { 
    host! 'api.example.com' 
    @goal = create(:goal)
  }

  test 'successful update' do 
    
    patch "/goals/#{ @goal.id }", 
      { goal: { motivation: "first motivation edit"} }.to_json, 
      { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }

    assert_response :success
    assert_equal "first motivation edit", @goal.reload.motivation
  end

  # test 'unsuccessful update on empty motivation' do 
  #   patch "/goals/#{ @goal.id }", 
  #     { goal: { motivation: '' } }.to_json,
  #     { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

  #   assert_equal 422, response.status
  # end
end
