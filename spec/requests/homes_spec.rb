require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "public" do
    describe "GET /top" do
      it "正常なレスポンスである" do
        get root_path
        expect(response).to be_success
      end
      
      it "200リクエストが返ってくる" do
        get root_path
        expect(response).to have_http_status "200"
      end
      
    end
  end
end
