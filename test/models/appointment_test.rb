require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @appointment = appointments(:completely_valid)
  end

  test 'appointment should not save without name' do
    @appointment.name = nil
    assert_not @appointment.valid?, 'Appointment without name is accepted'
  end

  test 'appointment name should be atleast 5 character' do
    @appointment.name = '1234'
    assert_not @appointment.valid?, 'Appointment with name less than 5 character is accepted'
  end

  test 'appointment name should be unique' do
    @appointment.save
    @appointment2 = appointments(:one)
    @appointment2.name = 'LetsSing'
    assert_not @appointment2.valid?, 'Appointment without unique name is accepted'
  end

  test 'timeslot_id should be present' do
    @appointment.timeslot_id = nil
    assert_not @appointment.valid?, 'Appointment without timeslot_id is accepted'
  end

  test 'vendor_id should be present' do
    @appointment.vendor_id = nil
    assert_not @appointment.valid?, 'Appointment without vendor_id is accepted'
  end

  test 'dock_id should be present' do
    @appointment.dock_id = nil
    assert_not @appointment.valid?, 'Appointment without dock_id is accepted'
  end

  test 'dateshould should be in future' do
    @appointment.datetime = DateTime.yesterday
    assert_not @appointment.valid?, 'Appointment with date in past is accepted'
  end
end
