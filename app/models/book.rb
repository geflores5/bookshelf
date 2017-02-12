class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :classification, presence: true
  validates :year, presence: true, numericality: true
end
