class DetailModel < ApplicationRecord
  belongs_to :model
  belongs_to :size
  belongs_to :color
  has_many :order_details, dependent: :destroy

  validates :price, presence: true, numericality: true
  validates :quantity, presence: true, numericality: true
  validates_associated :model
  validates_associated :color
  validates_associated :size
end