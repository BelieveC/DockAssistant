class State < ApplicationRecord
  has_many :dock_workers

  validates :name, presence: true,
                   length: { minimum: 5 },
                   uniqueness: true
end
