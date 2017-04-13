class Appointment < ApplicationRecord
  belongs_to :vendor
  belongs_to :timeslot
  has_many :shipments
  has_many :dock_workers, through: :shipments
  belongs_to :dock

  validates :datetime, presence: true,
                       inclusion: { in: (Date.today..Date.today + 5.years),
                                    message: 'date should be in future' }
  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 5 }
  validates :vendor_id, presence: true
  validates :dock_id, presence: true
  validates :timeslot_id, presence: true
end
