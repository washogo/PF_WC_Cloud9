require 'rails_helper'

RSpec.describe Evaluation, type: :model do
  describe 'バリデーション' do
    let(:category) { create(:category) }
    let(:customer) { create(:customer) }
    let(:lesson) { create(:lesson, customer_id: customer.id, category_id: category.id) }

    it '評価、レビューがあれば保存できる' do
      expect(FactoryBot.create(:evaluation, customer_id: customer.id, lesson_id: lesson.id)).to be_valid
    end

    it '評価がなければ保存できない' do
      expect(FactoryBot.build(:evaluation, customer_id: customer.id, lesson_id: lesson.id, evaluation: "")).to_not be_valid
    end

    it 'レビューがなければ保存できない' do
      expect(FactoryBot.build(:evaluation, customer_id: customer.id, lesson_id: lesson.id, review: "")).to_not be_valid
    end

  end

end