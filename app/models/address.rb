class Address < ApplicationRecord
  belongs_to :customer
  has_many :orders
  
  with_options presence: true do
    validates :name
    validates :postal_code
    validates :address
  end
  
  with_options uniqueness: true do
    validates :name
    validates :postal_code
    validates :address
  end
  
  
end
