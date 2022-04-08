require 'rails_helper'

RSpec.describe "Admin::Sessions", type: :request do
  describe "GET /login" do
    it "returns http success" do
      get "/admin/sessions/login"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /logout" do
    it "returns http success" do
      get "/admin/sessions/logout"
      expect(response).to have_http_status(:success)
    end
  end

end
