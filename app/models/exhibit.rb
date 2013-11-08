class Exhibit < ActiveRecord::Base
  validates :name, presence: true, length: { in: 2..50 }
  validates :registration_number, presence: true, length: { in: 2..8 }
  validates :opportunity_for_transportation, length: { maximum: 40 }
  validates :the_degree_of_preservation, length: { maximum: 140 }
  validates :description, length: { minimum: 3 }
end
