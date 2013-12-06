class Property < ActiveRecord::Base
  validates_presence_of :title, :value
end
