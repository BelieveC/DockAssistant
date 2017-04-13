class DockSchedule < ApplicationRecord
  belongs_to :dock
  belongs_to :timeslot
end
