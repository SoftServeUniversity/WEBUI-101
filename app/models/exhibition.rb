class Exhibition < ActiveRecord::Base
  geocoded_by :adress
  after_validation :geocode
  validates_presence_of :name , :adress

  validate :start_date_cannot_be_later_than_end_date

  def start_date_cannot_be_later_than_end_date
    if   start_date > end_date 
      errors.add(:start_date, "Start date can't be greater than end date")
    end
  end
end
