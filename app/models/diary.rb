class Diary < ApplicationRecord
  belongs_to :category

  validates :time, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
