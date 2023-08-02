class SubscriptionsSerializer
  include JSONAPI::serializer
  attributes :customer_id, :id, :title, :status, :frequency
end