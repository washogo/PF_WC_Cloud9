require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'バリデーション' do
    it 'カテゴリー名があれば保存できる' do
      expect(FactoryBot.create(:category)).to be_valid
    end
  
    it 'カテゴリー名がなければ保存できない' do
      expect(FactoryBot.build(:category, name: "")).to_not be_valid
    end
    
    it 'カテゴリー名が重複していれば保存できない' do
      create(:category, name: "Ruby")
      category2=build(:category, name: "Ruby")
      
      expect(category2.valid?).to eq false
    end
    
  end
  
  describe 'アソシエーション' do
    it 'Lessonモデルと1:Nの関係である' do
      expect(Category.reflect_on_association(:lessons).macro).to eq :has_many
    end
  end

end