require 'rails_helper'

RSpec.describe "Evaluations", type: :request do
  before do
    @customer=create(:customer)
  end

  describe "public" do
    describe "GET /new" do
      it "正常なレスポンスである" do
        sign_in @customer
        get new_evaluation_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @customer
        get new_evaluation_path
        expect(response).to have_http_status "200"
      end

    end

    describe "POST /create" do
      let(:customer) { create(:customer) }
      let(:category) { create(:category) }
      let(:lesson) { create(:lesson, customer_id: customer.id, category_id: category.id) }
      let(:have_lesson) { create(:have_lesson, customer_id: @customer.id, lesson_id: lesson.id) }

      it "evaluationを作成できる" do
        sign_in @customer
        expect {
          post "/evaluations", params: { evaluation: {
            evaluation: 5, review: "最高です。", lesson_id: have_lesson.lesson_id, customer_id: customer.id
          } }
        }.to change(lesson.evaluations, :count).by(1)
      end

      it "evaluationを作成後に所有講座一覧に遷移する" do
        sign_in @customer
        post "/evaluations", params: { evaluation: { evaluation: 5, review: "最高です。", lesson_id: lesson.id, customer_id: customer.id } }
        expect(response).to redirect_to have_lessons_path
      end
    end

    describe "GET /show" do
      let(:customer) { create(:customer) }
      let(:category) { create(:category) }
      let(:lesson) { create(:lesson, customer_id: customer.id, category_id: category.id) }
      let(:have_lesson) { create(:have_lesson, customer_id: @customer.id, lesson_id: lesson.id) }
      let(:evaluation) { create(:evaluation, customer_id: customer.id, lesson_id: lesson.id) }

      it "正常なレスポンスである" do
        sign_in @customer
        get evaluation_path(id: evaluation.id)
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @customer
        get evaluation_path(id: evaluation.id)
        expect(response).to have_http_status "200"
      end
    end

    describe "GET /index" do
      it "正常なレスポンスである" do
        sign_in @customer
        get evaluations_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @customer
        get evaluations_path
        expect(response).to have_http_status "200"
      end
    end

  end

  describe "admin" do
    before do
      @admin=create(:admin)
      customer=create(:customer)
      category=create(:category)
      lesson=create(:lesson, customer_id: customer.id, category_id: category.id)
      @evaluation=create(:evaluation, customer_id: customer.id, lesson_id: lesson.id)
    end

    describe "GET /show" do
      it "正常なレスポンスである" do
        sign_in @admin
        get admin_evaluation_path(id: @evaluation.id)
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @admin
        get admin_evaluation_path(id: @evaluation.id)
        expect(response).to have_http_status "200"
      end
    end

    describe "GET /index" do
      it "正常なレスポンスである" do
        sign_in @admin
        get admin_evaluations_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @admin
        get admin_evaluations_path
        expect(response).to have_http_status "200"
      end
    end

  end
end
