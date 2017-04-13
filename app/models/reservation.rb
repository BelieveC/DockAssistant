class Reservation < ApplicationRecord
  belongs_to :appointment
  belongs_to :dock
end
