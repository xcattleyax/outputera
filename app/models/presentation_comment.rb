class PresentationComment < ApplicationRecord
  belongs_to :user
  belongs_to :presentation

  validates :comment, presence: true
end
