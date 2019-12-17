class Order < ApplicationRecord
  belongs_to :payment_type
  belongs_to :shipping_type
  belongs_to :user
  has_many :order_details, dependent: :destroy

  scope :recent, lambda{ where(['created_at > ?', 30.days.ago]) }
end