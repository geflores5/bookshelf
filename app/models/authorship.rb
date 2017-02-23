class Authorship < ApplicationRecord
  belongs_to :author, foreign_key: :author_id
  belongs_to :book, foreign_key: book_id
end
