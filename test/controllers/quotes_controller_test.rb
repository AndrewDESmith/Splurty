require 'test_helper'

class QuotesControllerTest < ActionController::TestCase
  test "quote show page" do
    # Loads the templated quote instance data stored under the FactoryGirl class in test/factories.rb
    quote = FactoryGirl.create(:quote)
    # Trigger the show page
    get :show, :id => quote.id
    # Verify that the appropriate http status code is given to the browser
    assert_response :success
  end

  # Check that a 404 "not found" error message is given when a page doesn't exist
  test "quote show page, not found" do
    get :show, :id => 'OMG'
    assert_response :not_found
  end
end
