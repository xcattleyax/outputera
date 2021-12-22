class Follower < ApplicationRecord
  belongs_to :user

  validates :follow_id, presence: true
end
