class Gender < ApplicationRecord
  validates_uniqueness_of :name
  has_many :clothers
end
