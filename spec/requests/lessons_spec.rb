require 'rails_helper'

RSpec.describe "Lessons", type: :request do
  before do
    @customer=create(:customer)
    @category=create(:category)
  end

  describe "public" do
    describe "GET /new" do
      it "正常なレスポンスである" do
        sign_in @customer
        get new_lesson_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @customer
        get new_lesson_path
        expect(response).to have_http_status "200"
      end

    end

    describe "POST /create" do
      context "タグがない場合" do
        it "lessonを作成できる" do
          sign_in @customer
          expect{
            post "/lessons", params: { lesson: {
              name: "Rubyを学ぼう！",
              content: "Rubyの基礎を学ぶことができます。",
              attending_style: "offline",
              contract_period: "1",
              price: "10000",
              access: "大阪府大阪市",
              is_in_lecture: "true",
              category_id: @category.id,
            } }
          }.to change(@customer.lessons, :count).by(1)
        end

        it "lessonを作成後にマイページに遷移する" do
          sign_in @customer
          post "/lessons", params: { lesson: {
              name: "Rubyを学ぼう！",
              content: "Rubyの基礎を学ぶことができます。",
              attending_style: "offline",
              contract_period: "1",
              price: "10000",
              access: "大阪府大阪市",
              is_in_lecture: "true",
              category_id: @category.id
            } }
            expect(response).to redirect_to customer_path(id: @customer.id)
        end

      end

      context "タグがある場合" do
        it "lessonを作成できる" do
          sign_in @customer
          expect{
            post "/lessons", params: { lesson: {
              name: "Rubyを学ぼう！",
              content: "Rubyの基礎を学ぶことができます。",
              attending_style: "offline",
              contract_period: "1",
              price: "10000",
              access: "大阪府大阪市",
              is_in_lecture: "true",
              category_id: @category.id,
              tags: { name: "Ruby1,Ruby2" }
            } }
          }.to change(@customer.lessons, :count).by(1)
        end

        it "lessonを作成後にtagを作成する" do
          sign_in @customer
          expect{
            post "/lessons", params: { lesson: {
              name: "Rubyを学ぼう！",
              content: "Rubyの基礎を学ぶことができます。",
              attending_style: "offline",
              contract_period: "1",
              price: "10000",
              access: "大阪府大阪市",
              is_in_lecture: "true",
              category_id: @category.id,
              tags: { name: "Ruby1,Ruby2" }
            } }
          }.to change(Tag, :count).by(2)
        end

        it "tagを作成後にマイページに遷移する" do
          sign_in @customer
          post "/lessons", params: { lesson: {
              name: "Rubyを学ぼう！",
              content: "Rubyの基礎を学ぶことができます。",
              attending_style: "offline",
              contract_period: "1",
              price: "10000",
              access: "大阪府大阪市",
              is_in_lecture: "true",
              category_id: @category.id,
              tags: { name: "Ruby1,Ruby2" }
            } }
          expect(response).to redirect_to customer_path(id: @customer.id)
        end

      end

    end

    describe "GET /show" do
      before do
        customer=create(:customer)
        @lesson=create(:lesson, customer_id: customer.id, category_id: @category.id)
      end

      it "正常なレスポンスである" do
        sign_in @customer
        get lesson_path(id: @lesson.id)
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @customer
        get lesson_path(id: @lesson.id)
        expect(response).to have_http_status "200"
      end

    end

    describe "GET /index" do
      before do
        customer=create(:customer)
        @lesson=create(:lesson, customer_id: customer.id, category_id: @category.id)
      end

      it "正常なレスポンスである" do
        sign_in @customer
        get lessons_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @customer
        get lessons_path
        expect(response).to have_http_status "200"
      end

    end

    describe "GET /edit" do
      before do
        customer=create(:customer)
        @lesson=create(:lesson, customer_id: customer.id, category_id: @category.id)
      end

      it "正常なレスポンスである" do
        sign_in @customer
        get edit_lesson_path(id: @lesson.id)
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        sign_in @customer
        get edit_lesson_path(id: @lesson.id)
        expect(response).to have_http_status "200"
      end

    end

    describe "PATCH /update" do
      before do
        customer=create(:customer)
        @lesson=create(:lesson, customer_id: customer.id, category_id: @category.id)
        @tag1=create(:tag, name: "Ruby1")
        @tag2=create(:tag, name: "Ruby2")
        create(:tag_list, lesson_id: @lesson.id, tag_id: @tag1.id)
        create(:tag_list, lesson_id: @lesson.id, tag_id: @tag2.id)
      end

      context "タグを更新しない場合" do
        it "lessonを更新できる" do
          sign_in @customer
          patch "/lessons/#{@lesson.id}", params: { lesson: { price: 20000 } }
          expect(@lesson.reload.price).to eq 20000
        end

        it "lessonを更新後にマイページに遷移する" do
          sign_in @customer
          patch "/lessons/#{@lesson.id}", params: { lesson: { price: 20000 } }
          expect(response).to redirect_to customer_path(id: @customer.id)
        end
      end

      context "tagを更新する場合" do
        
        context "他のlessonがtagを使っていない場合" do
          it "lessonを更新できる" do
            sign_in @customer
            patch "/lessons/#{@lesson.id}", params: { lesson: {  price: 20000, tags: { name: "Ruby1,Ruby3,Ruby5" } } }
            expect(@lesson.reload.price).to eq 20000
          end

          it "tagを更新できる" do
            sign_in @customer
            expect{
              patch "/lessons/#{@lesson.id}", params: { lesson: { price: 20000, tags: { name: "Ruby1,Ruby3,Ruby5" } } }
            }.to change(Tag, :count).from(2).to(3)
          end

          it "tagを更新後にマイページに遷移する" do
            sign_in @customer
            patch "/lessons/#{@lesson.id}", params: { lesson: { price: 20000 } }
            expect(response).to redirect_to customer_path(id: @customer.id)
          end
        
        end
          
        context "他のlessonがtagを使っている場合" do
          before do
            @lesson2=create(:lesson, customer_id: @customer.id, category_id: @category.id)
            create(:tag_list, lesson_id: @lesson2.id, tag_id: @tag1.id)
            create(:tag_list, lesson_id: @lesson2.id, tag_id: @tag2.id)
          end
          
          it "lessonを更新できる" do
            sign_in @customer
            patch "/lessons/#{@lesson.id}", params: { lesson: {  price: 20000, tags: { name: "Ruby1,Ruby3,Ruby5" } } }
            expect(@lesson.reload.price).to eq 20000
          end

          it "tagを更新できる" do
            sign_in @customer
            expect{
              patch "/lessons/#{@lesson.id}", params: { lesson: { price: 20000, tags: { name: "Ruby1,Ruby3,Ruby5" } } }
            }.to change(Tag, :count).from(2).to(4)
          end

          it "tagを更新後にマイページに遷移する" do
            sign_in @customer
            patch "/lessons/#{@lesson.id}", params: { lesson: { price: 20000 } }
            expect(response).to redirect_to customer_path(id: @customer.id)
          end
          
        end
        
      end
      
    end

    describe "DELETE /destroy" do
      before do
        @lesson=create(:lesson, customer_id: @customer.id, category_id: @category.id)
      end

      it "lessonを削除できる" do
        sign_in @customer
        expect{ delete "/lessons/#{@lesson.id}" }.to change(@customer.lessons, :count).by(-1)
      end

      it "lessonを削除後にマイページに遷移する" do
        sign_in @customer
        delete "/lessons/#{@lesson.id}"
        expect(response).to redirect_to customer_path(id: @customer.id)
      end

    end

    describe "GET /search" do
      it "正常なレスポンスである" do
        get search_lessons_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        get search_lessons_path
        expect(response).to have_http_status "200"
      end

    end

    describe "POST /result" do
      context "タグを選択していない場合" do
        it "正常なレスポンスである" do
          post result_lessons_path, params: { search: {
            category_id: @category.id, attending_style: "offline", access: "大阪府泉佐野市", price: 50000
          } }
          expect(response).to be_success
        end

        it "200リクエストが返ってくる" do
          post result_lessons_path, params: { search: {
            category_id: @category.id, attending_style: "offline", access: "大阪府泉佐野市", price: 50000
          } }
          expect(response).to have_http_status "200"
        end
      end

      context "タグを選択している場合" do
        before do
          @tag1=create(:tag)
          @tag2=create(:tag)
        end

        it "正常なレスポンスである" do
          post result_lessons_path, params: { search: {
            category_id: @category.id, attending_style: "offline", access: "大阪府泉佐野市", price: 50000, tags: [@tag1.id, @tag2.id]
          } }
          expect(response).to be_success
        end

        it "正常なレスポンスである" do
          post result_lessons_path, params: { search: {
            category_id: @category.id, attending_style: "offline", access: "大阪府泉佐野市", price: 50000, tags: [@tag1.id, @tag2.id]
          } }
          expect(response).to have_http_status "200"
        end

      end
    end
  end

  describe "admin" do
    before do
      admin=create(:admin)
      sign_in admin
      @customer=create(:customer)
      category=create(:category)
      @lesson=create(:lesson, customer_id: @customer.id, category_id: category.id)
    end
    
    describe "GET /index" do
      it "正常なレスポンスである" do
        get admin_lessons_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        get admin_lessons_path
        expect(response).to have_http_status "200"
      end

    end

    describe "GET /show" do
      it "正常なレスポンスである" do
        get admin_lesson_path(id: @lesson.id)
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        get admin_lesson_path(id: @lesson.id)
        expect(response).to have_http_status "200"
      end

    end

    describe "DELETE /destroy" do
      it "lessonを削除できる" do
        expect{ delete "/admin/lessons/#{@lesson.id}" }.to change(@customer.lessons, :count).by(-1)
      end

      it "lessonを削除後に講座一覧画面に遷移する" do
        delete "/admin/lessons/#{@lesson.id}"
        expect(response).to redirect_to admin_lessons_path
      end

    end

  end
end
