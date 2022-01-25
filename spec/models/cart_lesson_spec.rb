require 'rails_helper'

RSpec.describe CartLesson, type: :model do
  describe 'アソシエーション' do
    it 'CustomerモデルとN:1の関係である' do
      expect(CartLesson.reflect_on_association(:customer).macro).to eq :belongs_to
    end
    
    it 'LessonモデルとN:1の関係である' do
      expect(CartLesson.reflect_on_association(:lesson).macro).to eq :belongs_to
    end
  end
  
end