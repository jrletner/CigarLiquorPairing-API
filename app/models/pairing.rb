class Pairing < ApplicationRecord
  belongs_to :user
  belongs_to :cigar
  belongs_to :liquor
end
