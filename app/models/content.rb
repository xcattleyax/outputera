class Content < ApplicationRecord
  belongs_to :presentation

  with_options presence: true do
    validates :page
    validates :content
    validates :text, length: { maximum: 1000 }
  end

  def self.page_set(page)
    if page.nil?
      1
    else
      page.max.to_i + 1
    end
  end
end
