class Content < ApplicationRecord
  belongs_to :presentation

  with_options presence: true do
    validates :page
    validates :content
    validates :text, length: { maximum: 1000 }
  end
end
