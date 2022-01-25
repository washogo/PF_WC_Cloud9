require 'rails_helper'

RSpec.describe "Customers", type: :request do
  before do
    @customer=create(:customer)
  end

  describe "public" do
    describe "GET /unique" do
      it '正常なレスポンスである' do
        sign_in @customer
        get current_customer_unique_path
        expect(response).to be_success
      end

      it '200リクエストが返ってくる' do
        sign_in @customer
        get current_customer_unique_path
        expect(response).to have_http_status "200"
      end
    end

    describe "GET /show" do
      it '正常なレスポンスである' do
        sign_in @customer
        customer=create(:customer, nickname: "shogo")
        get customer_path(id: customer.id)
        expect(response).to be_success
      end

      it '200リクエストが返ってくる' do
        sign_in @customer
        customer=create(:customer, nickname: "shogo")
        get customer_path(id: customer.id)
        expect(response).to have_http_status "200"
      end
    end

    describe "GET /personal" do
      it '正常なレスポンスである' do
        sign_in @customer
        get current_customer_personal_path
        expect(response).to be_success
      end

      it '200リクエストが返ってくる' do
        sign_in @customer
        get current_customer_personal_path
        expect(response).to have_http_status "200"
      end
    end

    describe "GET /transfer" do
      it '正常なレスポンスである' do
        sign_in @customer
        get current_customer_transfer_path
        expect(response).to be_success
      end

      it '200リクエストが返ってくる' do
        sign_in @customer
        get current_customer_transfer_path
        expect(response).to have_http_status "200"
      end
    end

    describe "PATCH /update" do
      it 'customerを更新できる' do
        sign_in @customer
        patch current_customer_path, params: { customer: { last_name: "yamada", last_name_kana: "ヤマダ" } }
        expect(@customer.reload.last_name).to eq "yamada"
      end

      it 'customerを更新後に詳細画面に遷移する' do
        sign_in @customer
        patch current_customer_path, params: { customer: { last_name: "yamada", last_name_kana: "ヤマダ" } }
        expect(response).to redirect_to customer_path(@customer.id)
      end
    end

    describe "GET /cancel" do
      it '正常なレスポンスである' do
        sign_in @customer
        get current_customer_cancel_path
        expect(response).to be_success
      end

      it '200リクエストが返ってくる' do
        sign_in @customer
        get current_customer_cancel_path
        expect(response).to have_http_status "200"
      end
    end

    describe "PATCH /quit" do
      it 'customerを更新できる' do
        sign_in @customer
        patch current_customer_quit_path, params: { customer: { is_deleted: true } }
        expect(@customer.reload.is_deleted).to eq true
      end

      it 'customerを更新後にホーム画面に遷移する' do
        sign_in @customer
        patch current_customer_quit_path, params: { customer: { is_deleted: true } }
        expect(response).to redirect_to root_path
      end
    end

  end

  describe "admin" do
    before do
      @admin=create(:admin)
    end
    
    describe "GET /index" do
      it '正常なレスポンスである' do
        sign_in @admin
        get admin_customers_path
        expect(response).to be_success
      end

      it '200リクエストが返ってくる' do
        sign_in @admin
        get admin_customers_path
        expect(response).to have_http_status "200"
      end
    end

    describe "GET /show" do
      it '正常なレスポンスである' do
        sign_in @admin
        get admin_customer_path(id: @customer.id)
        expect(response).to be_success
      end

      it '200リクエストが返ってくる' do
        sign_in @admin
        get admin_customer_path(id: @customer.id)
        expect(response).to have_http_status "200"
      end
    end

    describe "GET /edit" do
      it '正常なレスポンスである' do
        sign_in @admin
        get edit_admin_customer_path(id: @customer.id)
        expect(response).to be_success
      end

      it '200リクエストが返ってくる' do
        sign_in @admin
        get edit_admin_customer_path(id: @customer.id)
        expect(response).to have_http_status "200"
      end
    end

    describe "PATCH /update" do
      it 'customerを更新できる' do
        sign_in @admin
        patch "/admin/customers/#{@customer.id}", params: { customer: { is_deleted: true } }
        expect(@customer.reload.is_deleted).to eq true
      end

      it 'customerを更新後に一覧画面に遷移する' do
        sign_in @admin
        patch "/admin/customers/#{@customer.id}", params: { customer: { is_deleted: true } }
        expect(response).to redirect_to admin_customers_path
      end
    end

  end

end
