class Biography < ActiveRecord::Base
	validates_uniqueness_of :name, presence: true
	validates_uniqueness_of :description, presence: true
	has_and_belongs_to_many :exhibits
end
