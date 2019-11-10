class Sitter < ApplicationRecord
  belongs_to :sitter_user
  has_one :approved_sitter
  validates :name, :address, :suburb, :postcode, :price, presence: true
end
