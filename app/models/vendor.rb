class Vendor < ApplicationRecord
  has_many :appointments

  validates :name,presence: true,
					length: {minimum: 5},
					uniqueness:{case_sensitive: true}
end
