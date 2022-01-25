require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:customer) { create(:customer) }

  before do
    @comment=create(:comment, customer_id: customer.id)
  end

  describe "GET /new" do
    it '正常なレスポンスである' do
      sign_in customer
      get new_comment_path
      expect(response).to be_success
    end

    it '200リクエストが返ってくる' do
      sign_in customer
      get new_comment_path
      expect(response).to have_http_status "200"
    end

  end

  describe "POST /create" do

    it 'commentを作成できる' do
      sign_in customer
      expect{
        post "/comments", params: { comment: { comment: "とても勉強になります。", id: 1 } }
      }.to change(customer.comments, :count).by(1)
    end

    context 'main_commentの場合' do
      it 'commentを作成後に一覧画面に遷移する' do
        sign_in customer
        post "/comments", params: { comment: { comment: "とても勉強になります。" } }
        expect(response).to redirect_to comments_path
      end
    end

    context 'replyの場合' do
      params={ comment: { comment: "とても勉強になります。", id: 1} }
      it 'comment作成後にreply_relationshipを作成する' do
        sign_in customer
        post "/comments", params: params
        comment=create(:comment, customer_id: customer.id, comment: params[:comment][:comment])
        expect{
          create(:reply_relationship, main_comment_id: params[:comment][:id], reply_id: comment.id)
        }.to change(ReplyRelationship, :count).by(1)
      end

      it 'reply_relationshipを作成後に詳細画面に遷移する' do
        sign_in customer
        post "/comments", params: params
        comment=create(:comment, customer_id: customer.id, comment: params[:comment][:comment])
        expect(
          FactoryBot.create(:reply_relationship, main_comment_id: params[:comment][:id], reply_id: comment.id)
        ).to redirect_to comment_path(params[:comment][:id])
      end
    end

  end

  describe "GET /index" do
    it '正常なレスポンスである' do
      get comments_path
      expect(response).to be_success
    end

    it '200リクエストが返ってくる' do
      get comments_path
      expect(response).to have_http_status "200"
    end
  end

  describe "GET /show" do
    it '正常なレスポンスである' do
      sign_in customer
      get comment_path(@comment.id)
      expect(response).to be_success
    end

    it '200リクエストが返ってくる' do
      sign_in customer
      get comment_path(@comment.id)
      expect(response).to have_http_status "200"
    end

  end

  describe "GET /edit" do
    it '正常なレスポンスである' do
      sign_in customer
      get edit_comment_path(id: @comment.id)
      expect(response).to be_success
    end

    it '200リクエストが返ってくる' do
      sign_in customer
      get edit_comment_path(id: @comment.id)
      expect(response).to have_http_status "200"
    end
  end

  describe "PATCH /update" do
    it 'commentを更新できる' do
      sign_in customer
      patch "/comments/#{@comment.id}", params: { comment: { comment: "役に立ちました。" } }
      expect(@comment.reload.comment).to eq "役に立ちました。"
    end

    it 'commentを更新後に一覧画面に遷移する' do
      sign_in customer
      patch "/comments/#{@comment.id}", params: { comment: { comment: "役に立ちました。" } }
      expect(response).to redirect_to comments_path
    end
  end

  describe "DELETE /destroy" do
    it 'commentを削除できる' do
      sign_in customer
      expect {
        delete "/comments/#{@comment.id}"
      }.to change(customer.comments, :count).by(-1)
    end

    it 'commentを削除後に一覧画面に遷移する' do
      sign_in customer
      delete "/comments/#{@comment.id}"
      expect(response).to redirect_to comments_path
    end
  end
end
