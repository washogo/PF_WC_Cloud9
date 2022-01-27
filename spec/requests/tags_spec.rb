require 'rails_helper'

RSpec.describe "Tags", type: :request do
  before do
    admin=create(:admin)
    sign_in admin
    customer=create(:customer)
    category=create(:category)
    lesson=create(:lesson, customer_id: customer.id, category_id: category.id)
    @tag=create(:tag)
    @tag_list=create(:tag_list, lesson_id: lesson.id, tag_id: @tag.id)
  end

  describe "admin" do
    describe "GET /index" do
      it "正常なレスポンスである" do
        get admin_tags_path
        expect(response).to be_success
      end

      it "200リクエストが返ってくる" do
        get admin_tags_path
        expect(response).to have_http_status "200"
      end

    end

    describe "DELETE /destroy" do
      it "tagを削除できる" do
        expect{
          delete admin_tag_path(id: @tag.id)
        }.to change(Tag, :count).by(-1)
      end

      it "tagを削除後に関連するtag_listも削除できる" do
        expect{
          delete admin_tag_path(id: @tag.id)
        }.to change(TagList, :count).by(-1)
      end

      it "tagを削除後にタグ一覧画面に遷移する" do
        delete admin_tag_path(id: @tag.id)
        expect(response).to redirect_to admin_tags_path
      end

    end

  end

end
