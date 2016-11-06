class Timeslot < ApplicationRecord
	has_and_belongs_to_many :dock_workers
end
