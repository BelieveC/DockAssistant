require 'test_helper'

class DockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save dock without name" do
  	dock = Dock.new()
  	assert_not dock.save,"Saved the dock without name"
  end
end
