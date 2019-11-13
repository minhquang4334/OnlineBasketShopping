class DetailModel < ApplicationRecord
  belongs_to :model
  belongs_to :size
  belongs_to :color
end