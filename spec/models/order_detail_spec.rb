require 'rails_helper'

RSpec.describe OrderDetail, type: :model do
  describe 'バリデーション' do
    before do
      customer=create(:customer)
      category=create(:category)
      address=create(:address, customer_id: customer.id)
      @lesson=create(:lesson, customer_id: customer.id, category_id: category.id)
      @order=create(:order, customer_id: customer.id, address_id: address.id)
    end
    
    it '購入時価格があれば保存される' do
      expect(FactoryBot.create(:order_detail, order_id: @order.id, lesson_id: @lesson.id)).to be_valid
    end
    
    it '購入時価格がなければ保存されない' do
      expect(FactoryBot.build(:order_detail, order_id: @order.id, lesson_id: @lesson.id, price: "")).to_not be_valid
    end
    
  end
end