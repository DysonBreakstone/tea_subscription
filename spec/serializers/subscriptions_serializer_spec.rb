require 'rails_helper'

RSpec.describe "SubscriptionsSerializer" do
  describe "attributes" do
    before do
      test_data
    end

    it "lists all attributes" do
      json = JSON.parse(SubscriptionsSerializer.new(@customer_7.subscriptions).to_json, symbolize_names: true)

      expect(json[:data].size).to eq(3)

      json[:data].each do |datum|
        expect(datum).to have_key(:id)
        expect(datum).to have_key(:type)
        expect(datum).to have_key(:attributes)
        expect(datum[:attributes]).to have_key(:customer_id)
        expect(datum[:attributes]).to have_key(:title)
        expect(datum[:attributes]).to have_key(:status)
        expect(datum[:attributes]).to have_key(:frequency)
        expect(datum[:attributes]).to have_key(:price)
      end
    end

    it "price" do
      json = JSON.parse(SubscriptionsSerializer.new(@customer_7.subscriptions).to_json, symbolize_names: true)

      expect(json[:data][0][:attributes][:price]).to eq(194.0)
      expect(json[:data][1][:attributes][:price]).to eq(294.0)
      expect(json[:data][2][:attributes][:price]).to eq(145.0)
    end
  end
end