class Biography < ActiveRecord::Base
	validates :name, presence: true
	validates :description, presence: true
  has_and_belongs_to_many :exhibits
	has_and_belongs_to_many :tags
  scope :added_by, ->(current_user) { where(user_id: current_user.id) }

  def tags_string
    tags.pluck(:name).join(', ')
  end

  def tags_string=(string)
    self.tags = string.split(',').map(&:strip).reject(&:blank?).map do |tag|
      Tag.where(name: tag).first_or_create
    end
  end

  searchable do
    text :name, :description
  end

end
