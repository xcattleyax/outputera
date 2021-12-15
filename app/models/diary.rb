class Diary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  validates :date, presence: true
  validates :time, presence: true
  validates :category_id, numericality: { other_than: 1 }

  
end
