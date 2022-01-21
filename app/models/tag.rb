class Tag < ApplicationRecord
  has_many :tag_lists

  validates :name, presence: true
  validates :name, uniqueness: true

end
