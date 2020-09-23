class Clinic < ApplicationRecord
  belongs_to :user
  validates :name, presence: true, uniqueness: true
  validates :address, presence: true
  has_many :vaccines, dependent: :destroy
end
