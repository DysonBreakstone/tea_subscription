class SubscriptionsSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :title, :status, :frequency

  attributes :price do |subscription|
    subscription.teas.select("SUM()")
  end
end