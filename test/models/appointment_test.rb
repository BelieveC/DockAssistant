require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save appointment without all params " do
  	appointment = Appointment.new()
  	assert_not appointment.save,"Saved the appointment without name"
  end
end
