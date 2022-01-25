require 'rails_helper'

RSpec.describe Lesson, type: :model do
  describe 'バリデーション' do
    let(:category) { create(:category) }
    let(:customer) { create(:customer) }
    
    it '名前、内容、受講形態、契約期間、価格、アクセス先、開講状況があれば保存できる' do
      expect(FactoryBot.create(:lesson, category_id: category.id, customer_id: customer.id)).to be_valid
    end

    it '名前がなければ保存できない' do
      expect(FactoryBot.build(:lesson, category_id: category.id, customer_id: customer.id, name: "")).to_not be_valid
    end

    it '内容がなければ保存できない' do
      expect(FactoryBot.build(:lesson, category_id: category.id, customer_id: customer.id, content: "")).to_not be_valid
    end

    it '受講形態がなければ保存できない' do
      expect(FactoryBot.build(:lesson, category_id: category.id, customer_id: customer.id, attending_style: "")).to_not be_valid
    end

    it '契約期間がなければ保存できない' do
      expect(FactoryBot.build(:lesson, category_id: category.id, customer_id: customer.id, contract_period: "")).to_not be_valid
    end

    it '価格がなければ保存できない' do
      expect(FactoryBot.build(:lesson, category_id: category.id, customer_id: customer.id, price: "")).to_not be_valid
    end

    it 'アクセス先がなければ保存できない' do
      expect(FactoryBot.build(:lesson, category_id: category.id, customer_id: customer.id, access: "")).to_not be_valid
    end

    it '開講状況がなければ保存できない' do
      expect(FactoryBot.build(:lesson, category_id: category.id, customer_id: customer.id, is_in_lecture: "")).to_not be_valid
    end
  end

  describe 'リレーション' do
    it 'Tagモデルと1:Nの関係である' do
      expect(Lesson.reflect_on_association(:tags).macro).to eq :has_many
    end

  end

  describe 'インスタンスメソッド' do
    let(:category) { create(:category) }
    let(:customer) { create(:customer) }
    let(:lesson) { create(:lesson, customer_id: customer.id, category_id: category.id) }

    it '#save_tag' do
      tag_list=["Ruby", "Java"]
      expect(lesson.save_tag(tag_list)).to be_truthy
    end
    
    it '#tax_price' do
      tax_price=lesson.tax_price
      expect(tax_price).to eq 11000
    end
    
  end

end