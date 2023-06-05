class Cigar < ApplicationRecord
  belongs_to :user
  has_many :pairings, dependent: :destroy
  has_many :liquors, through: :pairings, dependent: :destroy

  validates :name, presence: true
  validates :brand, presence: true
  validates :description, presence: true
end
