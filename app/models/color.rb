
class Color < ApplicationRecord
  has_many :models, :through => :detail_models
end