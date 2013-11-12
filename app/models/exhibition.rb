class Exhibition < ActiveRecord::Base
  geocoded_by :adress
  after_validation :geocode
  validate :start_date_cannot_be_later_than_end_date
 
  def start_date_cannot_be_later_than_end_date
  	# p '=============================================='
  	# p start_date
  	# p end_date
  	# p sdate = Date.strptime(self.start_date, '%d-%m-%Y')
  	# p edate = Date.strptime(self.end_date, '%d-%m-%Y')
  	# p '=============================================='
  	# binding.pry
    if   start_date > end_date 
      errors.add(:start_date, "Start date can't be greater than end date")
    end
  end
end
