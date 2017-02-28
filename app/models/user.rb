class User < ApplicationRecord
  has_many :orders

  has_many :paid_orders, -> { where(:is_paid => true) }, :class_name => "Order", :foreign_key => "user_id"

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
