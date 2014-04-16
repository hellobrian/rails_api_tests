require 'test_helper'

class ListingGoalsTest < ActionDispatch::IntegrationTest
  setup { host! 'api.example.com' }

  test 'returns list of all goals' do
    get '/goals'
    assert_equal 200, response.status
    refute_empty response.body
  end
end