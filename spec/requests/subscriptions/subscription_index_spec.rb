require 'rails_helper'

RSpec.describe "index" do
  describe "get all user subscriptions" do
    before do
      test_data
    end

    it "response status" do
      get customer_subscriptions_path(@customer_1)

      expect(response).to have_http_status(200)
    end

    it "gives data" do
      get customer_subscriptions_path(@customer_1)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json).to have_key(:data)
      expect(json[:data].first[:type]).to eq("subscriptions")
      expect(json[:data].size).to eq(2)
      expect(json[:data].first[:id]).to eq(@subscription_1.id.to_s)

      first_attributes = json[:data].first[:attributes]
      expect(first_attributes[:customer_id]).to eq(@customer_1.id)
      expect(first_attributes[:title]).to be_a(String)
      expect(first_attributes[:status]).to be_in([true, false])
      expect(first_attributes[:frequency]).to be_a(Integer)
    end
  end

  describe "Sad Paths" do
    before do
      test_data
    end

    it "no customer" do
      get customer_subscriptions_path(84848484848484)
      expect(response).to have_http_status(404)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:errors]).to eq("Customer does not exist.")
    end

    it "no subscriptions" do
      customer_13 = Customer.create(first_name: "Thirteen First", last_name: "Thirteen Last", email: "Customer@Thirteen.com")
      get customer_subscriptions_path(customer_13)

      json = JSON.parse(response.body, symbolize_names: true)
      expect(json[:data]).to eq("Customer currently has no subscriptions.")
    end
  end
end