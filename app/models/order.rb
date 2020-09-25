class Order < ApplicationRecord
  belongs_to :vaccine
  belongs_to :user
  validates :quantity, presence: true, :numericality => { greater_than: 0 }
  validates :unit_price, presence: true
  has_one :review
end
