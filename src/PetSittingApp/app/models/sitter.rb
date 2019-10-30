class Sitter < ApplicationRecord
  belongs_to :sitter_user
  has_one :approved_sitter
end
