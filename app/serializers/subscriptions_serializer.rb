class SubscriptionsSerializer
  include JSONAPI::Serializer
  attributes :customer_id, :title, :status, :frequency
end