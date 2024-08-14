class Debt < ApplicationRecord
  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
end

