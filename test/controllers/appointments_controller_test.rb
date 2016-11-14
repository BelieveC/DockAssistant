require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { name: @appointment.name,datetime: @appointment.datetime, vendor_id: @appointment.vendor_id,dock_id: @appointment.dock_id,"datetime(1i)": "2020","datetime(2i)":"11","datetime(3i)":"11","datetime(4i)":"11","datetime(5i)":"11"  } }
    end

    assert_redirected_to appointment_url(Appointment.last)
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_url(@appointment)
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { datetime: @appointment.datetime,vendor_id: @appointment.vendor_id,dock_id: @appointment.dock_id,name: @appointment.name } }
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete appointment_url(@appointment)
    end
    assert_redirected_to appointments_url
  end
  
end
