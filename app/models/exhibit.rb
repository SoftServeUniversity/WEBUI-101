class Exhibit < ActiveRecord::Base
  validates :name, presence: true
  validates :registration_number, presence: true

end
