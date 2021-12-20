class Presentation < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :detail
  belongs_to :category
  belongs_to :user
  has_many :contents
  has_many :presentation_comments
  has_many :presentation_answers

  validates :title, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :detail_id, presence: true

  def self.page_set(params)
    if params[:page].nil?
      1
    else
      params[:page].to_i
    end
  end
end
