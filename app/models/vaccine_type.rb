class VaccineType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :vaccine, dependent: :destroy
end
