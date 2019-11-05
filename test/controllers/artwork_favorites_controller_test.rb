require 'test_helper'

class ArtworkFavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get artwork_favorites_update_url
    assert_response :success
  end

end
