class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  
  has_many :order_details
  
  enum payment_method: { credit_card: 0, bank_transfer: 1 }
end
