class Order < ApplicationRecord
  belongs_to :customer
  belongs_to :address
  belongs_to :payment_method

  has_many :order_details

  enum order_status: { payment_waiting: 0, delivery_pending: 1, completed: 2 }

  with_options presence: true do
    # validates :payment_method
    validates :total_price
    validates :order_status
    validates :shipping_fee
  end

  validates :order_status, inclusion: { in: ["payment_waiting", "delivery_pending", "completed"] }

  with_options numericality: true do
    validates :total_price
    validates :shipping_fee
  end

end
