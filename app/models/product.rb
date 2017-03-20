class Product < ApplicationRecord
  belongs_to :category
  mount_uploader :image, ImageUploader
  acts_as_list
end
