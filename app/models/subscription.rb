class Subscription < ApplicationRecord
  belongs_to :customer
  has_many :subscription_teas
  has_many :subscriptions, through: :subscription_teas

  validates_presence_of :title
  # validates_presence_of :status
  validates_numericality_of :frequency
end