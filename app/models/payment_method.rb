class PaymentMethod < ApplicationRecord
  belongs_to :customer
  
  enum method: { credit_card: 0, bank_transfer: 1 }
  
  validates :method, presence: true, inclusion: { in: ["credit_card", "bank_transfer"] }
  
end
