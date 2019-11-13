class Size < ApplicationRecord
  has_many :models, :through => :detail_models
end