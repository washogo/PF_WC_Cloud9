require 'rails_helper'

RSpec.describe "HaveLessons", type: :request do
  describe "public" do
    before do
      customer=create(:customer)
      category=create(:category)
      lesson=create(:lesson, customer_id: customer.id, category_id: category.id)
      @have_lesson=create(:have_lesson, customer_id: customer.id, lesson_id: lesson.id)
      sign_in customer
    end
    
    describe "GET /index" do
      it "正常なレスポンスである" do
        get have_lessons_path
        expect(response).to be_success
      end
      
      it "200リクエストが返ってくる" do
        get have_lessons_path
        expect(response).to have_http_status "200"
      end
      
    end
    
    describe "GET /show" do
      it "正常なレスポンスである" do
        get have_lesson_path(id: @have_lesson.id)
        expect(response).to be_success
      end
      
      it "200リクエストが返ってくる" do
        get have_lesson_path(id: @have_lesson.id)
        expect(response).to have_http_status "200"
      end
      
    end
    
    describe "PATCH /update" do
      it "have_lessonを更新できる" do
        patch have_lesson_path(id: @have_lesson.id), params: { have_lesson: { progress: 70 } }
        expect(@have_lesson.reload.progress).to eq 70
      end
      
      it "have_lessonを更新後に所有講座一覧画面に遷移する" do
        patch have_lesson_path(id: @have_lesson.id), params: { have_lesson: { progress: 70 } }
        expect(response).to redirect_to have_lessons_path
      end
      
    end
    
  end
end
