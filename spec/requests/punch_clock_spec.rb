require 'rails_helper'

RSpec.describe "PunchClocks", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/punch_clock/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/punch_clock/create"
      expect(response).to have_http_status(:success)
    end
  end

end
