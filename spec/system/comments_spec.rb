require 'rails_helper'

RSpec.describe "Comments", type: :system do
  describe "コメント機能が正常に動く" do
    context "ログインしている場合" do
      before do
        @customer=create(:customer, email: "example@gmail.com", password: "123456")
        visit new_customer_session_path
        fill_in "メールアドレス", with: "example@gmail.com"
        fill_in "パスワード", with: "123456"
        click_on "ログインする"
      end
      
      describe "コメントを投稿できる" do
        it "新規コメントを投稿する", js: true do
          find("#communicate-tag").hover
          find(".menu-8").click
          expect(current_path).to eq new_comment_path
          expect{
            fill_in "内容", with: "がんばりましょう！"
            click_on "コメントする"
          }.to change(Comment, :count).from(0).to(1)
          expect(current_path).to eq comments_path
        end

        it "コメント一覧画面から返信する" do
          customer=create(:customer)
          comment=create(:comment, customer_id: customer.id, comment: "がんばりましょう！")
  
          visit comments_path
          expect{
            fill_in "返信コメント", with: "はい！"
            click_on "返信する"
          }.to change(Comment, :count).from(1).to(2)
          expect(current_path).to eq comment_path(comment.id)
  
        end
  
        it "コメント詳細画面から返信する", js: true do
          customer=create(:customer)
          comment=create(:comment, customer_id: customer.id, comment: "がんばりましょう！")
  
          visit comment_path(comment.id)
          find("#open").click
          expect(page).to have_content "返信コメント"
          expect{
            fill_in "返信コメント", with: "いいえ！"
            click_on "返信する"
          }.to change(Comment, :count).from(1).to(2)
          expect(page).to have_selector "p", text: "いいえ！"
  
        end
      end

      describe "コメントを編集する" do
        it "一覧画面から編集できる" do
          comment=create(:comment, customer_id: @customer.id, comment: "がんばりましょう！")
          visit comments_path
          expect(page).to have_link "編集"
          click_on "編集"

          expect(current_path).to eq edit_comment_path(comment.id)
          fill_in "コメント", with: "諦めるな！"
          click_on "編集する"
          expect(comment.reload.comment).to eq "諦めるな！"

          expect(current_path).to eq comments_path
          expect(page).to have_content "諦めるな！"
        end

        it "詳細画面から削除できる" do
          comment=create(:comment, customer_id: @customer.id, comment: "がんばりましょう！")
          visit comment_path(comment.id)
          expect(page).to have_link "編集"
          click_on "編集"

          expect(current_path).to eq edit_comment_path(comment.id)
          fill_in "コメント", with: "諦めるな！"
          click_on "編集する"
          expect(comment.reload.comment).to eq "諦めるな！"

          expect(current_path).to eq comments_path
          expect(page).to have_content "諦めるな！"
        end

      end

      describe "コメントを削除できる" do
        it "一覧画面から削除できる" do
          create(:comment, customer_id: @customer.id, comment: "がんばりましょう！")
          visit comments_path
          expect(page).to have_link "削除"
          click_on "削除"

          expect(current_path).to eq comments_path
          expect(page).to_not have_content "がんばりましょう！"

        end

        it "詳細画面から削除できる" do
          comment=create(:comment, customer_id: @customer.id, comment: "がんばりましょう！")
          visit comment_path(comment.id)
          expect(page).to have_link "削除"
          click_on "削除"

          expect(current_path).to eq comments_path
          expect(page).to_not have_content "がんばりましょう！"

        end
      end

    end

    context "ログインしていない場合" do
      it "新規コメントを投稿できない" do
        visit new_comment_path
        expect(current_path).to_not eq new_comment_path
        expect(current_path).to eq new_customer_session_path
      end

      it "コメント一覧画面から返信できない" do
        customer=create(:customer)
        create(:comment, customer_id: customer.id, comment: "がんばりましょう！")
        visit comments_path
        expect(current_path).to eq comments_path
        expect(page).to have_content "がんばりましょう！"
        expect(page).to_not have_button "返信する"

      end

      it "コメント詳細画面に遷移できない" do
        customer=create(:customer)
        comment=create(:comment, customer_id: customer.id, comment: "がんばりましょう！")
        visit comments_path
        expect(current_path).to eq comments_path
        expect(page).to have_content "がんばりましょう！"
        click_on "#{comment.id}"
        expect(page).to have_content "アカウント登録もしくはログインしてください。"

      end

      it "コメント一覧画面からコメントを編集・削除できない" do
        customer=create(:customer)
        create(:comment, customer_id: customer.id, comment: "がんばりましょう！")
        visit comments_path
        expect(current_path).to eq comments_path
        expect(page).to have_content "がんばりましょう！"
        expect(page).to_not have_button "返信する"
        expect(page).to_not have_link "編集"
        expect(page).to_not have_link "削除"
      end

    end
  end
end
