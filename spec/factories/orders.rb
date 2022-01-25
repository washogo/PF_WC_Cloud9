FactoryBot.define do
  factory :order do
    sequence(:payment_method) { ["credit_card", "bank_transfer"].sample }
    total_price { 55000 }
    sequence(:order_status) { ["payment_waiting", "delivery_pending", "completed"].sample }
    shipping_fee { 800 }
  end
end
