require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
  	@appointment = Appointment.new
  end

  test "appointment should not save without name" do
  	@appointment.name = nil
  	@appointment.vendor_id = 1
  	@appointment.dock_id = 1
  	@appointment.timeslot_id = 1
  	@appointment.datetime = DateTime.now +10.days
  	assert_not @appointment.save
  end	

  test "appointment name should be atleast 5 character" do
  	@appointment.vendor_id = 1
  	@appointment.dock_id = 1
  	@appointment.timeslot_id = 1
  	@appointment.datetime = Date.today+10.days
  	@appointment.name = "1234"
  	assert_not @appointment.save
  end

  test "appointment name should be unique" do
  	@appointment.vendor_id = 1
  	@appointment.dock_id = 1
  	@appointment.timeslot_id = 1
  	@appointment.datetime = Date.today+10.days
  	@appointment.name = "Recommend"
  	@appointment.save

  	@appointment2 = Appointment.new
  	@appointment2.name = "Recommend"
  	@appointment.vendor_id = 1
  	@appointment.dock_id = 1
  	@appointment.timeslot_id = 1
  	@appointment.datetime = Date.today+10.days
  	assert_not @appointment2.save
  end


end
