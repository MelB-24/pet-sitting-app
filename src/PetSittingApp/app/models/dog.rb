class Dog < ApplicationRecord
  belongs_to :owner
  enum sex: { female: 0, male: 1 }
end
