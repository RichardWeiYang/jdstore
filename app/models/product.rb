class Product < ApplicationRecord
  belongs_to :category
  has_many :groupships
  has_many :groups, :through => :groupships
  mount_uploader :image, ImageUploader
  acts_as_list
end
