require 'rails-helper'

RSpec.describe SubscriptionTea, type: :model do
  describe "relationships" do
    it { should belong_to :subscription }
    it { should belong_to :tea }
  end

  describe "validations" do
    it { should validate_numericality_of :quantity }
  end
end