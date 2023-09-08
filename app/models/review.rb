class Review < ApplicationRecord
  # Validations and associations
  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
  validates :content, presence: true

  belongs_to :restaurant
end
