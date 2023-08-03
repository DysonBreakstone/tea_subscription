require 'rails_helper'

RSpec.describe "New Subscription Facade" do
  describe "#create subscriptions" do
    before do
      test_data
      @six = @tea_6.id
      @seven = @tea_7.id
      @eight = @tea_8.id
    end
    
    it "creates subscription and returns true" do
      sub = {
          "title": "This is for my pet",
          "frequency": 4,
          "teas": {
            @six.to_s => 6,
            @seven.to_s => 7,
            @eight.to_s => 8
          }
      }

      expect(@customer_1.subscriptions.size).to eq(2)

      new_sub = NewSubscriptionFacade.create_subscriptions(@customer_1.id, sub)
      
      @customer_1.reload
      expect(@customer_1.subscriptions.size).to eq(3)
      expect(new_sub).to eq(true)
    end

    it "returns false if teas are not real" do
      sub = {
          "title": "This is for my pet",
          "frequency": 4,
          "teas": {
            "84848484848484" => 6,
            @seven.to_s => 7,
            @eight.to_s => 8
          }
        }
      
      new_sub = NewSubscriptionFacade.create_subscriptions(@customer_1.id, sub)

      expect(new_sub).to eq(false)
    end

    it "returns false if given improper data" do
      sub = {
          "title": "This is for my pet",
          "frequency": "My pet is a nice doggy",
          "teas": {
            @six => 6,
            @seven.to_s => 7,
            @eight.to_s => 8
          }
        }

      new_sub = NewSubscriptionFacade.create_subscriptions(@customer_1.id, sub)

      expect(new_sub).to eq(false)
    end
  end
end