require 'test_helper'

class DockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@dock = Dock.new
  end

  test "dock should not save without name" do
  	@dock.name = nil
  	assert_not @dock.save,"Dock without name is accepted"
  end	

  test "dock name should be atleast 5 character" do
  	@dock.name = "1234"
  	assert_not @dock.save,"Dock name with less than 5 character is accepted"
  end

  test "dock name should be unique" do
  	@dock.name = "Mumbai"
  	@dock.save
  	@dock2 = Dock.new
  	@dock2.name = "Mumbai"
  	assert_not @dock2.save,"Dock name which is not unique is accepted"
  end
end
