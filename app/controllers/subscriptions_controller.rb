class SubscriptionsController < ApplicationController
  def index
    user = User.find_by_id(subcription_params[:id])
    if user
      render json: SubscriptionsSerializer.new()
    else
      render json: {errors: "User does not exist."}
    end
  end

  private

    def subscription_params
      params.permit(:id)
    end
end