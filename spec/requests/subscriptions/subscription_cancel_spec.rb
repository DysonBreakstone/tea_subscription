require 'rails_helper'

RSpec.describe "cancel" do
  describe "cancels subscription" do
    before do
      test_data
    end

    it "successful response" do
      put "/customers/#{@customer_10.id}/subscriptions/#{@subscription_19.id}", params: {status: false}
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(204)
      expect(json[:data].first[:type]).to eq("subscriptions")
    end

    it "cancels subscription" do
      expect(@customer_7.subscriptions.where({ status: false })).to eq(1)
      
      put "/customers/#{@customer_7.id}/subscriptions/#{@subscription_19.id}", params: {status: false}

      @customer_7.reload
      expect(@customer_7.subscriptions.where({ status: false })).to eq(2)

    end
  end
end