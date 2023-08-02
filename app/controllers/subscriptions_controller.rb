class SubscriptionsController < ApplicationController
  def index
    customer = Customer.find_by_id(subscription_params[:customer_id])
    # require 'pry'; binding.pry
    if customer
      render json: SubscriptionsSerializer.new(customer.subscriptions)
    else
      render json: {errors: "Customer does not exist."}, status: 404
    end
  end

  private

    def subscription_params
      params.permit(:customer_id)
    end
end