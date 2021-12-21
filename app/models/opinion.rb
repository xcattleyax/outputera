class Opinion < ApplicationRecord

  belongs_to :user

  with_options presence: true do
    validates :title
    validates :content
  end
end
