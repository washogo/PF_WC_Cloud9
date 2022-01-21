class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :lesson
  
  validates :price, presence: true
  validates :price, numericality: true
  
end
