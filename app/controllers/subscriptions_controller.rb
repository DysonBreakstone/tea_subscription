class SubscriptionsController < ApplicationController
  def index
    customer = Customer.find_by_id(subscription_params[:customer_id])
    if customer
      if customer.subscriptions.size == 0
        render json: {data: "Customer currently has no subscriptions."}
      else
        render json: SubscriptionsSerializer.new(customer.subscriptions)
      end
    else
      render json: {errors: "Customer does not exist."}, status: 404
    end
  end

  private

    def subscription_params
      params.permit(:customer_id)
    end
end