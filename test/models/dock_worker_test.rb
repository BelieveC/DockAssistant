require 'test_helper'

class DockWorkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save dock_worker without all params " do
  	dock_worker = DockWorker.new()
  	assert_not dock_worker.save,"Saved the dock_worker without name"
  end
end
