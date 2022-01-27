require 'rails_helper'

RSpec.describe "Orders", type: :system do
  before do
    @customer=create(:customer, email: "example@gmail.com", password: "123456")
    visit new_customer_session_path
    fill_in "メールアドレス", with: "example@gmail.com"
    fill_in "パスワード", with: "123456"
    check "次回以降自動ログインする"
    click_on "ログインする"
    customer=create(:customer)
    category=create(:category)
    @lesson1=create(:lesson, customer_id: customer.id, category_id: category.id, name: "Rubyを学ぼー！")
    @lesson2=create(:lesson, customer_id: customer.id, category_id: category.id, name: "Rubyを学ぼう！２")
  end

  describe "カート情報" do
    it "カートに講座を登録する" do
      visit lessons_path
      expect(page).to have_selector "h4", text: "#{@lesson1.name}"
      all("h4")[0].click_on "#{@lesson1.name}"
      expect(current_path).to eq lesson_path(id: @lesson1.id)
      expect(page).to have_selector "h2", text: "#{@lesson1.name}"
      click_on "学ぶ"
      expect(current_path).to eq cart_lessons_path
      expect(page).to have_selector "td", text: "#{@lesson1.name}"
    end

    it "カートの講座を削除する" do
      create(:cart_lesson, lesson_id: @lesson1.id, customer_id: @customer.id)
      create(:cart_lesson, lesson_id: @lesson2.id, customer_id: @customer.id)
      
      visit cart_lessons_path
      expect(page).to have_selector "td", text: "#{@lesson1.name}"
      expect(page).to have_selector "td", text: "#{@lesson2.name}"
      expect{ all("td")[3].click_on "削除" }.to change(CartLesson, :count).from(2).to(1)
      expect(page).to_not have_selector "td", text: "#{@lesson1.name}"
      expect(page).to have_selector "td", text: "#{@lesson2.name}"
    end
    
    context "カートに講座がある場合" do
      it "注文画面に遷移する" do
        create(:cart_lesson, lesson_id: @lesson1.id, customer_id: @customer.id)
        
        visit cart_lessons_path
        expect(page).to have_selector "td", text: "#{@lesson1.name}"
        expect(page).to have_selector "p", text: "【数量】1　点"
        expect(page).to have_selector "p", text: "【合計】11000　円"
        click_on "注文画面へ"
        expect(current_path).to eq new_order_path
        expect(page).to have_selector "h2", text: "注文情報入力画面"
      end
    end
    
    context "カートに講座がない場合" do
      it "注文画面に遷移できない" do
        visit cart_lessons_path
        expect(page).to have_selector "p", text: "【数量】0　点"
        expect(page).to have_selector "p", text: "【合計】0　円"
        click_on "注文画面へ"
        expect(page).to have_content "カートが空です。"
        expect(current_path).to eq cart_lessons_path
      end
    end

  end

  describe "注文情報" do
    it "配送先がある場合に注文確認画面まで進む" do
      create(:address, customer_id: @customer.id, name: "鈴木一郎", postal_code: "1234567", address: "東京都港区")
      create(:cart_lesson, lesson_id: @lesson1.id, customer_id: @customer.id)
      
      visit new_order_path
      expect(page).to have_field("鈴木一郎　〒1234567　東京都港区")
      choose "鈴木一郎　〒1234567　東京都港区"
      choose "クレジットカード"
      click_on "注文確認画面へ"
      expect(current_path).to eq orders_confirmation_path
      expect(page).to have_selector "td", text: "Rubyを学ぼー！"
      
    end
    
    it "配送先がない場合に注文確認画面まで進む" do
      create(:cart_lesson, lesson_id: @lesson1.id, customer_id: @customer.id)
      
      visit new_order_path
      expect(page).to have_link "配送先を登録する"
      click_link "配送先を登録する"
      expect(current_path).to eq addresses_path
      
      fill_in "宛名", with: "鈴木一郎"
      fill_in "郵便番号", with: "1234567"
      fill_in "住所", with: "東京都港区"
      click_on "登録する"
      expect(page).to have_selector "td", text: "鈴木一郎"
      click_link "カート"
      expect(current_path).to eq cart_lessons_path
      
      expect(page).to have_selector "td", text: "#{@lesson1.name}"
      expect(page).to have_selector "p", text: "【数量】1　点"
      expect(page).to have_selector "p", text: "【合計】11000　円"
      click_on "注文画面へ"
      expect(current_path).to eq new_order_path
      
      expect(page).to have_field("鈴木一郎　〒1234567　東京都港区")
      choose "鈴木一郎　〒1234567　東京都港区"
      choose "クレジットカード"
      click_on "注文確認画面へ"
      expect(current_path).to eq orders_confirmation_path
      expect(page).to have_selector "td", text: "Rubyを学ぼー！"
    end
    
    it "注文を完了する" do
      create(:address, customer_id: @customer.id, name: "鈴木一郎", postal_code: "1234567", address: "東京都港区")
      create(:cart_lesson, lesson_id: @lesson1.id, customer_id: @customer.id)
      
      visit new_order_path
      choose "鈴木一郎　〒1234567　東京都港区"
      choose "クレジットカード"
      click_on "注文確認画面へ"
      expect(current_path).to eq orders_confirmation_path
      
      expect(page).to have_selector "td", text: "#{@lesson1.name}"
      expect(page).to have_selector "p", text: "鈴木一郎"
      expect(page).to have_selector "p", text: "クレジットカード"
      click_on "注文する"
      expect(current_path).to eq orders_completed_path
      expect(page).to have_content "注文ありがとうございました！"
    end  
    
  end

end
