class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rate, numericality: { only_float: true, in: (0..5) }
end
