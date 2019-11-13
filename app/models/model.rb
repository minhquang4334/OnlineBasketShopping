class Model < ApplicationRecord
  has_many :detail_models, :dependent => :destroy
  has_many :sizes, :through => :detail_models
  has_many :colors, :through => :detail_models
  accepts_nested_attributes_for :detail_models

  mount_uploader :image, PictureUploader

  validates :name, presence: true, length: {maximum: 30}
  validates :description, presence: true, length: {maximum: 1000}
  validates :image, presence: true
end