require 'test_helper'

class QuoteTest < ActiveSupport::TestCase

  # Test that calling .unique_tag on a quote will return the author's initials and the quote id #.  e.g., KM#2
  test "unique_tag" do
    # The database is cleaned out automatically between tests, leaving nothing in it when the test runs.  So we need to create a new quote to for this test.
    quote = FactoryGirl.create(:quote, :author => 'Ken Mazaika')
    expected = 'KM#' + quote.id.to_s
    actual = quote.unique_tag
    # assert_equal requires the expected value to be the 1st parameter, and the actual value to be the 2nd parameter.
    assert_equal expected, actual
  end

end
