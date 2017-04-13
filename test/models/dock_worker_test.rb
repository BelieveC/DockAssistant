require 'test_helper'

class DockWorkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @dock_worker = dock_workers(:completely_valid)
  end

  test 'Dock Worker should have first name' do
    @dock_worker = dock_workers(:one)
    @dock_worker.first_name = nil
    assert_not @dock_worker.valid?, 'Dock Worker without first name is accepted'
  end

  test 'Dock Worker should have last name' do
    @dock_worker.last_name = nil
    assert_not @dock_worker.valid?, 'Dock Worker without last name is accepted'
  end

  test 'Dock Worker should have zipcode of atleast 6 digit' do
    @dock_worker.zipcode = '1234'
    assert_not @dock_worker.valid?, 'Dock Worker with zipcode less than 6 is accepted'
  end

  test 'Dock Worker should have payrate' do
    @dock_worker.pay_rate = nil
    assert_not @dock_worker.valid?, 'Dock Worker without pay_rate is accepted'
  end

  test 'Dock Worker should have state_id' do
    @dock_worker.state_id = nil
    assert_not @dock_worker.valid?, 'Dock Worker without state_id is accepted'
  end

  test 'Dock Worker should have address of atleast 10 character' do
    @dock_worker.address = 'mumbai'
    assert_not @dock_worker.valid?, 'Dock Worker with address less than 10 character is accepted'
  end

  test 'Dock worker should have unique first_name and last_name combined' do
    @dock_worker.save
    @dock_worker2 = dock_workers(:one)
    @dock_worker2.first_name = 'Johnson'
    @dock_worker2.last_name = 'Dwayne'
    assert_not @dock_worker2.valid?, 'Dock Worker with same first_name and last_name combined is accepted'
  end
end
