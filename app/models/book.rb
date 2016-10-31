class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :cover_uri, presence: true
  validates :asin, presence: true, uniqueness: true
end
