require 'rails_helper'

RSpec.describe "cancel" do
  describe "cancels subscription" do
    before do
      test_data
    end

    it "successful response" do
      put "/customers/#{@customer_10.id}/subscriptions/#{@subscription_19.id}", params: {status: false}
      # require 'pry'; binding.pry
      # json = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to have_http_status(204)
      # expect(json[:data].first[:type]).to eq("subscriptions")
    end
    
    it "cancels subscription" do
      expect(@customer_7.subscriptions.where({ status: false }).size).to eq(1)
      
      put "/customers/#{@customer_7.id}/subscriptions/#{@subscription_19.id}", params: {status: false}
      
      @customer_7.reload
      expect(@customer_7.subscriptions.where({ status: false }).size).to eq(2)
    end
  end
  
  describe "sad paths" do
    it "no subscription" do
      customer = Customer.create(first_name: "Brian", last_name: "Nobody", email: "Brian@Nobody.com")
      put "/customers/#{customer.id}/subscriptions/8484848484844", params: {status: false}
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(404)
      expect(json[:errors]).to eq("Subscription not found.")
    end
  end
end