class Exhibit < ActiveRecord::Base
  validates :name, presence: true
  validates :registration_number, presence: true
  has_and_belongs_to_many :tags

  def tags_string
    tags.pluck(:name).join(', ')
  end

  def tags_string=(string)
    self.tags = string.split(',').map(&:strip).reject(&:blank?).map do |tag|
      Tag.where(name: tag).first_or_create
    end
  end

end
