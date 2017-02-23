class Author < ApplicationRecord
  has_many :authorships, foreign_key: :author_id
  has_many :books, through: :authorships
end
