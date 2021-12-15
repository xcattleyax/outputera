class Presentation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user
  has_many :presentation_content

  validates :title, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }

end
