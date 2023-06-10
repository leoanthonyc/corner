require 'test_helper'

class LinksControllerTest < ActionDispatch::IntegrationTest
  test 'should get redirect because of missing session' do
    get links_url
    assert_response :redirect
  end
end
