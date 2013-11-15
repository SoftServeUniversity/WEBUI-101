class Exhibit < ActiveRecord::Base
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true
  validates :name, presence: true
  validates :registration_number, presence: true

end
