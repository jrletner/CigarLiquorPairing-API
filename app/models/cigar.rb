class Cigar < ApplicationRecord
  belongs_to :user
  has_many :pairings
  has_many :liquors, through: :pairings

  validates :name, presence: true
  validates :brand, presence: true
  validates :description, presence: true
end
