class NoteAnswer < ApplicationRecord

  belongs_to :user
  belongs_to :note

  with_options presence: true do
    validates :content
    validates :text, length: { maximum: 1000 }
  end
end
