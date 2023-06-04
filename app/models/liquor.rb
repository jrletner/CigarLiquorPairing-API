class Liquor < ApplicationRecord
  belongs_to :user
  has_many :pairings
  has_many :cigars, through: :pairings

  validates :name, presence: true
  validates :brand, presence: true
  validates :description, presence: true
end
