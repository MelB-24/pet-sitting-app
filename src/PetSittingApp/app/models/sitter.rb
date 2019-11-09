class Sitter < ApplicationRecord
  belongs_to :sitter_user
  has_one :approved_sitter
  validates :name, :address, :suburb, :postcode, :price, presence: true
  validates :postcode, length: { is: 4, message: "Wrong" }
end
