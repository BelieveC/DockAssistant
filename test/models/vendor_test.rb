require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
  	@vendor = Vendor.new
  end

  test "vendor should not save without name" do
  	@vendor.name = nil
  	assert_not @vendor.save
  end	

  test "vendor name should be atleast 5 character" do
  	@vendor.name = "1234"
  	assert_not @vendor.save
  end

  test "vendor name should be unique" do
  	@vendor.name = "Clarkes"
  	@vendor.save
  	@vendor2 = Vendor.new
  	@vendor2.name = "Clarkes"
  	assert_not @vendor2.save
  end
end
