require 'test_helper'

class ApiTest < ActiveSupport::TestCase
  include Rack::Test::Methods

  def app
    Rails.application
  end

  test 'test 1' do
    get "/api/statuses/test_1.json", { values: "1 2 3 4" }
    assert_equal 200, last_response.status
    assert_equal [1,2,3,4], JSON.parse(last_response.body)
  end

  test 'test 2' do
    get "/api/statuses/test_2.json", { values: "1 2 3 4" }
    assert_equal 400, last_response.status
    assert_equal({"error"=>"values is invalid"}, JSON.parse(last_response.body))
  end
end
