class Order < ApplicationRecord
  belongs_to :vaccine
  belongs_to :user
  validates :quantity, presence: true, :numericality => { greater_than: 0 }
  validates :unit_price, presence: true
  has_one :review

  def string_price
    sprintf('R$ %.2f', unit_price).gsub('.', ',')
  end

  def string_total_price
    sprintf('R$ %.2f', unit_price * quantity).gsub('.', ',')
  end
end
