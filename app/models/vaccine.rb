class Vaccine < ApplicationRecord
  belongs_to :vaccine_type
  belongs_to :clinic
  validates :price, presence: true
  has_many :orders
  validates :vaccine_type, uniqueness: { scope: :clinic }
end
