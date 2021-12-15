class Note < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text, length: { maximum: 1000 }
  end
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
