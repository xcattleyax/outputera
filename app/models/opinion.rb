class Opinion < ApplicationRecord

  belongs_to :User

  with_options presence: true do
    validates :title
    validates :content
  end
end
