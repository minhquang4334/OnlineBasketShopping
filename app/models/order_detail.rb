class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :detail_model

  scope :recent, lambda{ where(['created_at > ?', 30.days.ago]) }
end