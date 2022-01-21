class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address

  has_many :order_details

  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum order_status: { payment_waiting: 0, delivery_pending: 1, completed: 2 }
  
  with_options presence: true do
    validates :payment_method
    validates :total_price
    validates :order_status
    validates :shipping_fee
  end
  
  validates :payment_method, inclusion: { in: [0, 1] }
  validates :order_status, inclusion: { in: [0, 1, 2] }
  
  with_options numericality: true do
    validates :total_price
    validates :shipping_fee
  end

  def tax_price
    self.price * 1.1
  end

end
