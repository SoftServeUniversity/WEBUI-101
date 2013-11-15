class Picture < ActiveRecord::Base
  belongs_to :exhibit
  validates_presence_of :image
  mount_uploader :image, ImageUploader
end
