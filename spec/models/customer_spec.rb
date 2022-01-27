require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'バリデーション' do
    it 'メールアドレス、パスワード、姓、名、セイ、メイ、郵便番号、住所、電話番号、振込先、ニックネーム、会員ステータスがあれば登録できる' do
      expect(FactoryBot.create(:customer)).to be_valid
    end

    it '姓がなければ登録できない' do
      expect(FactoryBot.build(:customer, last_name: "")).to_not be_valid
    end

    it '名がなければ登録できない' do
      expect(FactoryBot.build(:customer, first_name: "")).to_not be_valid
    end

    it 'セイがなければ登録できない' do
      expect(FactoryBot.build(:customer, last_name_kana: "")).to_not be_valid
    end

    it 'メイがなければ登録できない' do
      expect(FactoryBot.build(:customer, first_name_kana: "")).to_not be_valid
    end

    it '郵便番号がなければ登録できない' do
      expect(FactoryBot.build(:customer, postal_code: "")).to_not be_valid
    end

    it '住所がなければ登録できない' do
      expect(FactoryBot.build(:customer, address: "")).to_not be_valid
    end

    it '電話番号がなければ登録できない' do
      expect(FactoryBot.build(:customer, phone_number: "")).to_not be_valid
    end

    it '振込先がなければ登録できない' do
      expect(FactoryBot.build(:customer, transfer_target: "")).to_not be_valid
    end

    it 'ニックネームがなければ登録できない' do
      expect(FactoryBot.build(:customer, nickname: "")).to_not be_valid
    end

    it '会員ステータスがなければ登録できない' do
      expect(FactoryBot.build(:customer, is_deleted: "")).to_not be_valid
    end

    it '電話番号が重複していれば登録できない' do
      create(:customer, phone_number: "09099999999")
      expect(FactoryBot.build(:customer, phone_number: "09099999999")).to_not be_valid
    end

    it '振込先が重複していれば登録できない' do
      create(:customer, transfer_target: "ゆうちょ銀行本店")
      expect(FactoryBot.build(:customer, transfer_target: "ゆうちょ銀行本店")).to_not be_valid
    end

    it 'ニックネームが重複していれば登録できない' do
      create(:customer, nickname: "washogo")
      expect(FactoryBot.build(:customer, nickname: "washogo")).to_not be_valid
    end

    it '会員ステータスがなければ登録できない' do
      expect(FactoryBot.build(:customer, is_deleted: "")).to_not be_valid
    end

  end

  describe 'インスタンスメソッド' do
    it '#full_name' do
      customer=create(:customer)
      expect(customer.full_name).to eq "wada shogo"
    end

    it '#full_name_kana' do
      customer=create(:customer)
      expect(customer.full_name_kana).to eq "ワダ ショウゴ"
    end

    it '#full_address' do
      customer=create(:customer)
      expect(customer.full_address).to eq "2345678 大阪府大阪市北区１丁目"
    end

  end

end