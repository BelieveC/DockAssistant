require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save without name" do
  	vendor = Vendor.new
  	assert_not vendor.save
  end
end
