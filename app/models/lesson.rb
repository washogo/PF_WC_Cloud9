class Lesson < ApplicationRecord
  belongs_to :category
  belongs_to :customer

  has_many :tag_lists
  has_many :tags, through: :tag_lists
  has_many :evaluation_lists
  has_many :cart_lessons
  has_many :order_details
  has_many :have_lessons

  enum attending_style: { online: 0, offline: 1 }

  def save_tag(made_tags)
    current_tags=self.tags.pluck(:name) unless self.tags.nil?
    old_tags=current_tags - made_tags
    new_tags=made_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(name: old)
    end

    new_tags.each do |new|
      new_tag=Tag.find_or_create_by(name: new)
      self.tags << new_tag
    end
  end
  
  scope :search, -> (search_params) do     
    return if search_params.blank?      

    category_id(search_params[:category_id])
      .attending_style(search_params[:attending_style])
      .access(search_params[:access])
      .price(search_params[:price])   
  end
  
  scope :category_id, -> (category_id) { where('category_id = ? ', category_id) if category_id.present? } 
  scope :attending_style, -> (attending_style) { where('attending_style = ?', attending_style) if attending_style.present? }
  scope :access, -> (access) { where('access LIKE ?', "%#{access}%") if access.present? }
  scope :price, -> (price) { where('price <= ?', price) if price.present? }
  
end
