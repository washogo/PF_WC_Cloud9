require 'rails_helper'

RSpec.describe "Orders", type: :request do
  describe "public" do
    before do
      @customer=create(:customer)
      sign_in @customer
      @address=create(:address, customer_id: @customer.id)
      customer=create(:customer)
      category=create(:category)
      @lesson=create(:lesson, customer_id: customer.id, category_id: category.id)
      @cart_lesson=create(:cart_lesson, customer_id: @customer.id, lesson_id: @lesson.id)
    end

    describe "GET /new" do
      it "正常なレスポンスである" do
        get new_order_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        get new_order_path
        expect(response).to have_http_status "200"
      end

    end

    describe "POST /confirmation" do
      it "正常なレスポンスである" do
        post orders_confirmation_path, params: { order: { address_id: @address.id, payment_method: "credit_card" } }
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        post orders_confirmation_path, params: { order: { address_id: @address.id, payment_method: "credit_card" } }
        expect(response).to have_http_status "200"
      end

    end

    describe "GET /completed" do
      it "正常なレスポンスである" do
        get orders_completed_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        get orders_completed_path
        expect(response).to have_http_status "200"
      end

    end

    describe "POST /create" do
      it "orderを作成できる" do
        expect{
          post "/orders/completed", params: { order: {
            shipping_fee: 500, payment_method: "credit_card", total_price: 66000, order_status: "payment_waiting", address_id: @address.id
          } }
        }.to change(@customer.orders, :count).by(1)
      end

      it "orderを作成後にorder_detailを作成できる" do
        expect{
          post "/orders/completed", params: { order: {
            shipping_fee: 500, payment_method: "credit_card", total_price: 66000, order_status: "payment_waiting", address_id: @address.id
          } }
        }.to change(@lesson.order_details, :count).by(1)
      end
      
      it "orderを作成後にhave_lessonを作成できる" do
        expect{
          post "/orders/completed", params: { order: {
            shipping_fee: 500, payment_method: "credit_card", total_price: 66000, order_status: "payment_waiting", address_id: @address.id
          } }
        }.to change(@lesson.have_lessons, :count).by(1)
      end

      it "have_lessonを作成後にcart_lessonを全て削除する" do
        expect{
          post "/orders/completed", params: { order: {
            shipping_fee: 500, payment_method: "credit_card", total_price: 66000, order_status: "payment_waiting", address_id: @address.id
          } }
        }.to change(@customer.cart_lessons, :count).by(-1)
      end

      it "orderを作成後に注文完了画面に遷移する" do
        post "/orders/completed", params: { order: {
          shipping_fee: 500, payment_method: "credit_card", total_price: 66000, order_status: "payment_waiting", address_id: @address.id
        } }
        expect(response).to redirect_to orders_completed_path
      end

    end

  end

  describe "admin" do
    before do
      admin=create(:admin)
      sign_in admin
      customer=create(:customer)
      address=create(:address, customer_id: customer.id)
      @order=create(:order, customer_id: customer.id, address_id: address.id)
    end
    
    describe "GET /show" do
      it "正常なレスポンスである" do
        get admin_order_path(id: @order.id)
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        get admin_order_path(id: @order.id)
        expect(response).to have_http_status "200"
      end

    end

    describe "PATCH /update" do
      it "orderを更新できる" do
        patch "/admin/orders/#{@order.id}", params: { order: { order_status: "completed" } }
        expect(@order.reload.order_status).to eq "completed"
      end

      it "orderを更新後に注文詳細画面に遷移する" do
        patch "/admin/orders/#{@order.id}", params: { order: { order_status: "completed" } }
        expect(response).to redirect_to admin_order_path(id: @order.id)
      end

    end

  end

end
