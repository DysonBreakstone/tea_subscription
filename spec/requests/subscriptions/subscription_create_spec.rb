require 'rails_helper'

RSpec.describe "create" do
  describe "subscription creation" do
    before do
      test_data

      six = @tea_6.id
      seven = @tea_7.id
      eight = @tea_8.id

      @subscription_params = {
        "new_subscription": {
          "title": "This is for my pet",
          "frequency": 4,
          "teas": {
            six.to_s => 6,
            seven.to_s => 7,
            eight.to_s => 8
          }
        }
      }
    end

    it "status ok" do
      post "/customers/#{@customer_6.id}/subscriptions", params: @subscription_params

      expect(response).to have_http_status(200)
    end

    it "creates subscription" do
      expect(@customer_6.subscriptions.size).to eq(1)

      post "/customers/#{@customer_6.id}/subscriptions", params: @subscription_params
      
      @customer_6.reload
      expect(@customer_6.subscriptions.size).to eq(2)
    end
    
    it "returns an updated list of customer's subscriptions" do
      post "/customers/#{@customer_6.id}/subscriptions", params: @subscription_params
      
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(json[:data].size).to eq(2)
      json[:data].each do |datum|
        expect(datum[:type]).to eq("subscriptions")
      end
      expect(json[:data].last[:attributes][:title]).to eq("This is for my pet")
    end
  end
  
  describe "sad paths" do
    before do
      test_data

      six = @tea_6.id
      seven = @tea_7.id
      eight = @tea_8.id
      @subscription_params = {
        "new_subscription": {
          "title": "This is for my pet",
          "frequency": 4,
          teas: {
            six.to_s => 6,
            seven.to_s => 7,
            eight.to_s => 8
          }
        }
      }
    end

    it "no teas" do
      customer = Customer.create!(first_name: "Bill", last_name: "Nobody", email: "Bill@Nobody.com")

      empty_params = {
          "new_subscription":{
            "title": "This is for my pet",
            "frequency": 4,
            "teas": {}
          }
        }
      
      post "/customers/#{customer.id}/subscriptions", params: empty_params
      json = JSON.parse(response.body, symbolize_names: true)
      
      expect(response).to have_http_status(422)
      expect(json[:errors]).to eq("Subscription cannot be empty")
    end
    
    it "customer does not exist" do
      post "/customers/1515151515151/subscriptions", params: @subscription_params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(404)
      expect(json[:errors]).to eq("Customer does not exist.")
    end

    it "incorrect subscription parameters" do
      six = @tea_6.id
      seven = @tea_7.id
      eight = @tea_8.id
      wrong_params = {
        "new_subscription": {
          "title": "This is for my pet",
          "frequency": "I have a pet cat",
          "teas": {
            six.to_s => 6,
            seven.to_s => 7,
            eight.to_s => 8
          }
        }
      }

      post "/customers/#{@customer_6.id}/subscriptions", params: wrong_params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:errors]).to eq("I'm sorry, something went wrong.")
    end
    
    it "tea does not exist" do
      seven = @tea_7.id
      eight = @tea_8.id
      no_tea_params = {
        "new_subscription": {
          "title": "This is for my pet",
          "frequency": 4,
          "teas": {
            848484848484.to_s => 6,
            seven.to_s => 7,
            eight.to_s => 8
          }
        }
      }

      post "/customers/#{@customer_6.id}/subscriptions", params: no_tea_params
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(400)
      expect(json[:errors]).to eq("I'm sorry, something went wrong.")
    end
  end
end