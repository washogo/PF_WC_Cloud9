require 'rails_helper'

RSpec.describe HaveLesson, type: :model do
  describe 'バリデーション' do
    let(:category) { create(:category) }
    let(:customer) { create(:customer) }
    let(:lesson) { create(:lesson, customer_id: customer.id, category_id: category.id) }
    
    it '学習ステータス、進捗があれば保存できる' do
      expect(FactoryBot.create(:have_lesson, customer_id: customer.id, lesson_id: lesson.id)).to be_valid
    end
    
    it '学習ステータスがなければ保存できない' do
      expect(FactoryBot.build(:have_lesson, customer_id: customer.id, lesson_id: lesson.id, is_in_study: "")).to_not be_valid
    end
    
    it '進捗がなければ保存できない' do
      expect(FactoryBot.build(:have_lesson, customer_id: customer.id, lesson_id: lesson.id, progress: "")).to_not be_valid
    end
    
  end
  
end