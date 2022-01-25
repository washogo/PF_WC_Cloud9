require 'rails_helper'

RSpec.describe Tag, type: :model do
  describe 'バリデーション' do
    it 'タグ名があれば保存できる' do
      expect(FactoryBot.create(:tag)).to be_valid
    end
    
    it 'タグ名がなければ保存できない' do
      expect(FactoryBot.build(:tag, name: "")).to_not be_valid
    end
    
    it 'タグ名が重複していれば保存できない' do
      tag=create(:tag, name: "Ruby")
      expect(FactoryBot.build(:tag, name: "Ruby")).to_not be_valid
    end
  end
  
end