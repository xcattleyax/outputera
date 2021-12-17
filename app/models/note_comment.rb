class NoteComment < ApplicationRecord

  belongs_to :user
  belongs_to :note

  validates :comment, presence: true
  validates :status_id, presence: true

end
