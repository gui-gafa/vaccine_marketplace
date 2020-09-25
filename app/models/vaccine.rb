class Vaccine < ApplicationRecord
  belongs_to :vaccine_type
  belongs_to :clinic
  validates :price, presence: true
  has_many :orders
  has_many :reviews, through: :orders
  validates :vaccine_type, uniqueness: { scope: :clinic }

  def string_price
    sprintf('R$ %.2f', price)
  end
end
