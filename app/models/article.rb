class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  scope :add_to_menu, -> { where(add_to_menu: true) }

  searchable do
    text :title, :content
  end
end
