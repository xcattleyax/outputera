class Note < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
  end
end
