class Category < ApplicationRecord
  has_many :lessons

  validates :name, presence: true, uniqueness: true

end
