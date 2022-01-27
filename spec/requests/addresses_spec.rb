require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  let(:customer) { create(:customer) }
  let(:address) { create(:address, customer_id: customer.id) }

  describe "GET /index" do
    it '正常なレスポンスである' do
      sign_in customer
      get addresses_path
      expect(response).to be_success
    end

    it '200レスポンスが返ってくる' do
      sign_in customer
      get addresses_path
      expect(response).to have_http_status "200"
    end
  end

  describe "POST /create" do
    it 'addressを作成後に一覧画面に遷移する' do
      sign_in customer
      post addresses_path, params: { address: { name: "suzuki", postal_code: "9876543", address: "和歌山県和歌山市" } }
      expect(response).to redirect_to addresses_path
    end

    it 'addressを作成できている' do
      sign_in customer
      expect{
        post addresses_path, params: { address: { name: "suzuki", postal_code: "9876543", address: "和歌山県和歌山市" } }
      }.to change(customer.addresses, :count).by(1)
    end
  end

  describe "GET /edit" do
    it '正常なレスポンスである' do
      sign_in customer
      get edit_address_path(id: address.id)
      expect(response).to be_success
    end

    it '200レスポンスが返ってくる' do
      sign_in customer
      get edit_address_path(id: address.id)
      expect(response).to have_http_status "200"
    end
  end

  describe "PATCH /update" do
    it 'addressを更新後に一覧画面に遷移する' do
      sign_in customer
      patch address_path(id: address.id), params: { address: { name: "suzuki" } }
      expect(response).to redirect_to addresses_path
    end

    it 'addressを正常に更新できる' do
      sign_in customer
      patch address_path(id: address.id), params: { address: { name: "suzuki" } }
      expect(address.reload.name).to eq "suzuki"
    end
  end

  describe "DELETE /destroy" do
    it 'addressを正常に削除できる' do
      sign_in customer
      address=create(:address, customer_id: customer.id)
      expect{ delete "/addresses/#{address.id}" }.to change(customer.addresses, :count).by(-1)
    end
    
    it 'addressを削除後に一覧画面に遷移する' do
      sign_in customer
      delete "/addresses/#{address.id}"
      expect(response).to redirect_to addresses_path
    end

  end
end
