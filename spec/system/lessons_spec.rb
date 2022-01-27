require 'rails_helper'

RSpec.describe "Lessons", type: :system do
  before do
    driven_by(:rack_test)
    @customer=create(:customer, email: "example@gmail.com", password: "123456")
    visit new_customer_session_path
    fill_in "メールアドレス", with: "example@gmail.com"
    fill_in "パスワード", with: "123456"
    check "次回以降自動ログインする"
    click_on "ログインする"
    @category=create(:category)
  end

  it "講座情報を入力して講座を作成することができる" do
    expect{
      visit new_lesson_path
      fill_in "講座名", with: "Ruby"
      fill_in "内容", with: "Rubyの応用を学びます。"
      select "#{@category.name}", from: "カテゴリー"
      fill_in "タグ（カンマで区切って入力してください）", with: "Ruby"
      select "オフライン", from: "受講形態"
      fill_in "アクセス先(URLまたは住所)", with: "大阪府大阪市"
      select "１ヶ月", from: "契約期間(１ヶ月は３０日とします)"
      fill_in "税抜価格", with: 10000
      choose "開講中"
      click_on "登録する"
    }.to change(Lesson, :count).from(0).to(1)
  end

  it "講座を作成後にマイページに遷移する" do
    visit new_lesson_path
    fill_in "講座名", with: "Ruby"
    fill_in "内容", with: "Rubyの応用を学びます。"
    select "#{@category.name}", from: "カテゴリー"
    fill_in "タグ（カンマで区切って入力してください）", with: "Ruby"
    select "オフライン", from: "受講形態"
    fill_in "アクセス先(URLまたは住所)", with: "大阪府大阪市"
    select "１ヶ月", from: "契約期間(１ヶ月は３０日とします)"
    fill_in "税抜価格", with: 10000
    choose "開講中"
    click_on "登録する"
    expect(current_path).to eq customer_path(@customer.id)
  end

end