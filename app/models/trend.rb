class Trend < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
