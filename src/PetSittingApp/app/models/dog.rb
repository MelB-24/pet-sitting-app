class Dog < ApplicationRecord
  belongs_to :owner
  enum sex: { female: 0, male: 1 }
  has_one_attached :picture
end
