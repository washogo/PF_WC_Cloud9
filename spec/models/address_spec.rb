require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'バリデーション' do
    it '宛名と郵便番号と住所があれば保存できる' do
      customer=create(:customer)
      expect(FactoryBot.create(:address, customer_id: customer.id)).to be_valid
    end
    
    it '宛名がなければ保存できない' do
      expect(FactoryBot.build(:address, name: "")).to_not be_valid
    end
    
    it '郵便番号がなければ保存できない' do
      expect(FactoryBot.build(:address, postal_code: "")).to_not be_valid
    end
    
    it '住所がなければ保存できない' do
      expect(FactoryBot.build(:address, address: "")).to_not be_valid
    end
    
  end
  
  describe 'アソシエーション' do
    it 'CustomerモデルとN:1の関係である' do
      expect(Address.reflect_on_association(:customer).macro).to eq :belongs_to
    end
  end
  
end