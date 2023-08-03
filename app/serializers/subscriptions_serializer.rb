class SubscriptionsSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :title, :status, :frequency

  attributes :price do |subscription|
    abba = subscription.subscription_teas.joins(:tea)
      .group("subscription_teas.id")
      .sum("subscription_teas.quantity * teas.price").values.sum
  end
end