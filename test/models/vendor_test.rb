require 'test_helper'

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @vendor = Vendor.new
  end

  test 'vendor should not save without name' do
    @vendor.name = nil
    assert_not @vendor.save, 'Vendor without name is accepted'
  end

  test 'vendor name should be atleast 5 character' do
    @vendor.name = '1234'
    assert_not @vendor.save, 'Vendor with name less than 5 character is accepted'
  end

  test 'vendor name should be unique' do
    @vendor.name = 'Clarkes'
    @vendor.save
    @vendor2 = Vendor.new
    @vendor2.name = 'Clarkes'
    assert_not @vendor2.save, 'Vendor without unique name is accepted'
  end
end
