require 'rails_helper'

RSpec.describe ReplyRelationship, type: :model do
  describe 'リレーション' do
    it 'Commentモデルとmain_commentとしてN:1の関係' do
      expect(ReplyRelationship.reflect_on_association(:main_comment).macro).to eq :belongs_to
    end
    
    it 'CommentモデルとreplyとしてN:1の関係' do
      expect(ReplyRelationship.reflect_on_association(:reply).macro).to eq :belongs_to
    end

  end
end