class Diary < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :user

  validates :date, presence: true
  validates :time, presence: true
  validates :category_id, numericality: { other_than: 1 }

  def self.status(diary_info, diary_info_yesterday)
    if diary_info.nil? && diary_info_yesterday.nil?
      nil
    elsif diary_info.nil?
      Date.today
    elsif diary_info_yesterday.nil?
      Date.today - 1
    else
      'OK'
    end
  end
end
