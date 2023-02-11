class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  default_scope { order(rate: :desc) }
end
