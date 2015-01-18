require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, " | rails tutorial"
    assert_equal full_title("Help"), "Help | rails tutorial"
  end
end