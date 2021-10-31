class Clother < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  belongs_to :gender
  belongs_to :nominal
  belongs_to :trend
end
