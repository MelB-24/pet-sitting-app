class Owner < ApplicationRecord
  belongs_to :owner_user
  has_many :approved_sitters
end
