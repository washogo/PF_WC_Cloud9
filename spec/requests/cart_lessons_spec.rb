require 'rails_helper'

RSpec.describe "CartLessons", type: :request do
    let(:customer) { create(:customer) }
    let(:category) { create(:category) }
    let(:lesson) { create(:lesson, customer_id: customer.id, category_id: category.id) }
    
  before do
    @cart_lesson=create(:cart_lesson, customer_id: customer.id, lesson_id: lesson.id)
  end

  describe "GET /create" do
    it 'cart_lessonを作成できる' do
      sign_in customer
      expect{
        post "/cart_lessons", params:{ cart_lesson: { lesson_id: lesson.id } }
      }.to change(customer.cart_lessons, :count).by(1)
    end

    it 'cart_lessonを作成後に一覧画面へ遷移する' do
      sign_in customer
      post "/cart_lessons", params:{ cart_lesson: { lesson_id: lesson.id } }
      expect(response).to redirect_to cart_lessons_path
    end

  end

  describe "GET /index" do
    it '正常なレスポンスである' do
      sign_in customer
      get cart_lessons_path
      expect(response).to be_success
    end

    it '200リクエストが返ってくる' do
      sign_in customer
      get cart_lessons_path
      expect(response).to have_http_status "200"
    end

  end

  describe "GET /destroy" do
    it 'cart_lessonを削除することができる' do
      sign_in customer
      expect{
        delete cart_lesson_path(id: @cart_lesson.id)
      }.to change(customer.cart_lessons, :count).by(-1)
    end

    it 'cart_lessonを削除後に一覧画面に遷移する' do
      sign_in customer
      delete cart_lesson_path(@cart_lesson.id)
      expect(response).to redirect_to cart_lessons_path
    end

  end
end
