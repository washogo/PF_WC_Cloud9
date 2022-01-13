class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address

  has_many :order_details

  enum payment_method: { credit_card: 0, bank_transfer: 1 }
  enum order_status: { payment_waiting: 0, delivery_pending: 1, completed: 2 }

  def tax_price
    self.price * 1.1
  end

end
