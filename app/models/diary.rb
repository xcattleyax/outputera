class Diary < ApplicationRecord

  with options presence: true do
    validates :time
    validates :category_id
  end

end