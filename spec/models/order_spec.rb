require 'rails_helper'

RSpec.describe Order, type: :model do
  describe 'バリデーション' do
    let(:customer) { create(:customer) }
    let(:address) { create(:address, customer_id: customer.id) }

    it '支払方法、総額、注文ステータス、送料があれば保存できる' do
      expect(FactoryBot.create(:order, customer_id: customer.id, address_id: address.id)).to be_valid
    end

    it '支払方法がなければ保存できない' do
      expect(FactoryBot.build(:order, customer_id: customer.id, address_id: address.id, payment_method: "")).to_not be_valid
    end

    it '総額がなければ保存できない' do
      expect(FactoryBot.build(:order, customer_id: customer.id, address_id: address.id, total_price: "")).to_not be_valid
    end

    it '注文ステータスがなければ保存できない' do
      expect(FactoryBot.build(:order, customer_id: customer.id, address_id: address.id, order_status: "")).to_not be_valid
    end

    it '送料がなければ保存できない' do
      expect(FactoryBot.build(:order, customer_id: customer.id, address_id: address.id, shipping_fee: "")).to_not be_valid
    end

  end
  
end