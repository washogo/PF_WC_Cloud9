require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーション' do
    it 'コメントがあれば保存される' do
      customer=create(:customer)
      expect(FactoryBot.create(:comment, customer_id: customer.id)).to be_valid
    end

    it 'コメントがなければ保存できない' do
      customer=create(:customer)
      expect(FactoryBot.build(:comment, customer_id: customer.id, comment: "")).to_not be_valid
    end
  end

  describe 'アソシエーション' do
    it 'CustomerモデルとN:1の関係である' do
      expect(Comment.reflect_on_association(:customer).macro).to eq :belongs_to
    end

    it 'ReplyingRelationshipモデルと1:Nの関係である' do
      expect(Comment.reflect_on_association(:replying_relationships).macro).to eq :has_one
    end

    it 'ReplyingRelationshipモデルとreplyingとして1:Nの関係である' do
      expect(Comment.reflect_on_association(:replying).macro).to eq :has_one
    end

    it 'ReplyingRelationshipモデルとN:1の関係である' do
      expect(Comment.reflect_on_association(:replied_relationships).macro).to eq :has_many
    end

    it 'ReplyingRelationshipモデルとrepliedとしてN:1の関係である' do
      expect(Comment.reflect_on_association(:replied).macro).to eq :has_many
    end

  end

end