# == Schema Information
#
# Table name: exhibits
#
#  id                             :integer          not null, primary key
#  name                           :string(255)
#  registration_number            :string(255)
#  date_of_receipt                :date
#  fund_creator                   :string(255)
#  opportunity_for_transportation :string(255)
#  the_degree_of_preservation     :string(255)
#  authenticity                   :boolean
#  the_electronic_version         :boolean
#  size                           :string(255)
#  description                    :text
#  created_at                     :datetime
#  updated_at                     :datetime
#

class Exhibit < ActiveRecord::Base
  has_many :pictures
  accepts_nested_attributes_for :pictures, allow_destroy: true
  validates :name, presence: true
  validates :registration_number, presence: true
  has_and_belongs_to_many :tags

  has_and_belongs_to_many :biographies

  belongs_to :user
  def tags_string
    tags.pluck(:name).join(', ')
  end
  
  def biographies_string
    biographies.pluck(:name).join(', ')
  end

  def biographies_string=(string)
    self.biographies = string.split(',').map(&:strip).reject(&:blank?).map do |biographie|
      Biography.where(name: biographie).first_or_create
    end
  end  

  def tags_string=(string)
    self.tags = string.split(',').map(&:strip).reject(&:blank?).map do |tag|
      Tag.where(name: tag).first_or_create
    end
  end

  has_and_belongs_to_many :exhibitions

  scope :available, -> { where(available: true) }
  scope :added_by, ->(current_user) { where(user_id: current_user.id) }

  def unavailability
    exhibitions.map {|exhibition| (exhibition.start_date..exhibition.end_date)  unless exhibition.virtual? }
  end

  def available_for_dates?(start_date, end_date, exhibition)
    return false unless available
    return true if exhibition.virtual?
    unavailability.none? {|date_range| date_range === start_date && date_range === end_date }
  end

  def to_label
    "#{name} | registration number: #{registration_number}"
  end

  searchable do
    text :name, :description
  end
end
