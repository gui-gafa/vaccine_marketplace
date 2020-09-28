class VaccineType < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  has_many :vaccine, dependent: :destroy

  def normalize_description
    description.split(/(?=Do que é feita|Indicação)\s*/).join("\n")
  end

  include PgSearch::Model

  pg_search_scope :search_by_name_and_description,
                  against: { name: 'A', description: 'B' },
                  using: {
                    tsearch: { prefix: true }
                  }
end
