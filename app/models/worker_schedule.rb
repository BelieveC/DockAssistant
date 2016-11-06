class WorkerSchedule < ApplicationRecord
	belongs_to :dock_worker
	belongs_to :timeslot
end
