class Order < ApplicationRecord
  belongs_to :payment_type
  belongs_to :shipping_type
  belongs_to :user
  has_many :order_details, dependent: :destroy
end