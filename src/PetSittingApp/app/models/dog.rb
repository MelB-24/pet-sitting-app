class Dog < ApplicationRecord
  belongs_to :owner
  # enum used for sex for ease of use in form.
  enum sex: { female: 0, male: 1 }
  # has picture attached via aws services. 
  has_one_attached :picture
end
