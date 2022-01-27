require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "admin" do
    before do
      admin=create(:admin)
      sign_in admin
    end
    
    describe "GET /index" do
      it "正常なレスポンスである" do
        get admin_categories_path
        expect(response).to be_success
      end
      
      it "200リクエストが返ってくる" do
        get admin_categories_path
        expect(response).to have_http_status "200"
      end
      
    end
    
    describe "POST /create" do
      it "categoryを作成できる" do
        expect{
          post "/admin/categories", params: { category: { name: "React.js" } }
        }.to change(Category, :count).from(0).to(1)
      end
      
      it "categoryを作成後にカテゴリー一覧画面に遷移する" do
        post "/admin/categories", params: { category: { name: "React.js" } }
        expect(response).to redirect_to admin_categories_path
      end
      
    end
    
    describe "DELETE /destroy" do
      before do
        @category=create(:category)  
      end
      
      it "categoryを削除することができる" do
        expect{
          delete "/admin/categories/#{@category.id}"
        }.to change(Category, :count).from(1).to(0)
      end
      
      it "category削除後にカテゴリー一覧画面に遷移する" do
        delete "/admin/categories/#{@category.id}"
        expect(response).to redirect_to admin_categories_path
      end
      
    end
    
    describe "PATCH /update" do
      before do
        @category=create(:category)  
      end
      
      it "categoryを更新できる" do
        patch admin_category_path(id: @category.id), params: { category: { name: "Java" } }
        expect(@category.reload.name).to eq "Java"
      end
      
      it "categoryを更新後にカテゴリー一覧画面に遷移する" do
        patch admin_category_path(id: @category.id), params: { category: { name: "Java" } }
        expect(response).to redirect_to admin_categories_path
      end
      
    end
    
  end
end
