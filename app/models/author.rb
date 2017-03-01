class Author < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true, numericality: true

  has_many :authorships
  has_many :books, through: :authorships
end
