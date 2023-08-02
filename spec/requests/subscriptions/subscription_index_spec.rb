require 'rails_helper'

RSpec.describe "index" do
  describe "get all user subscriptions" do
    before do
      test_data
    end

    it "response" do
      get customer_subscriptions_path(@customer_1)

      expect(response).to have_http_status(200)
      require 'pry'; binding.pry
    end

    it "gives data" do
      get customer_subscriptions_path(@customer_1)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to have_key(:data)
      expect(json).to have_key(:type)
      expect(json[:data].size).to eq(2)
      require 'pry'; binding.pry
    end
  end
end