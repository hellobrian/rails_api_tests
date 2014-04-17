require 'test_helper'

class UpdatingGoalsTest < ActionDispatch::IntegrationTest
  
  fixtures :goals
  setup { 
    host! 'api.example.com' 
    @goal = goals(:one)
  }

  test 'successful update' do 
    # @goal = goals(:one)
    
    patch "/goals/#{ @goal.id }", 
      { goal: { motivation: "first motivation edit"} }.to_json, 
      { "Accept" => Mime::JSON, "Content-Type" => Mime::JSON.to_s }

    assert_equal 200, response.status
    assert_equal "first motivation edit", @goal.reload.motivation
  end

  # test 'unsuccessful update on empty motivation' do 
  #   patch "/goals/#{ @goal.id }", 
  #     { goal: { motivation: '' } }.to_json,
  #     { 'Accept' => Mime::JSON, 'Content-Type' => Mime::JSON.to_s }

  #   assert_equal 422, response.status
  # end
end
