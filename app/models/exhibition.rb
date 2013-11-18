# == Schema Information
#
# Table name: exhibitions
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  start_date  :date
#  end_date    :date
#  adress      :string(255)
#  latitude    :float
#  longitude   :float
#  virtual     :boolean
#  created_at  :datetime
#  updated_at  :datetime
#

class Exhibition < ActiveRecord::Base
  geocoded_by :adress
  after_validation :geocode
  validates_presence_of :name, :adress
  validate :start_date_cannot_be_later_than_end_date

  has_and_belongs_to_many :exhibits

  def available_exhibits
    available_exhibits_for(self).reject {|exhibit| self.exhibits.include?(exhibit) }
  end
  private

    def available_exhibits_for(exhibition)
      exhibition.virtual? ? Exhibit.all : Exhibit.available
    end

    def start_date_cannot_be_later_than_end_date
      if start_date && end_date && start_date > end_date
        errors.add(:start_date, "Start date can't be greater than end date")
      end
    end
end
