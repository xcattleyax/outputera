class PresentationAnswer < ApplicationRecord
  belongs_to :user
  belongs_to :presentation

  with_options presence: true do
    validates :content
    validates :text, length: { maximum: 1000 }
  end
end
