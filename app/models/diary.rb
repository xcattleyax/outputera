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

  def self.note_search(category_id, title)
    if category_id != "" && title != ""
      notes = Note.where(category_id: category_id)
      notes.where('title LIKE(?)', "%#{title}%")
    elsif title != ""
      Note.where('title LIKE(?)', "%#{title}%")
    elsif category_id != ""
      Note.where(category_id: category_id)
    else
      Note.all
    end
  end

  def self.presentation_search(category_id, title)
    if category_id != "" && title != ""
      presentations = Presentation.where(category_id: category_id)
      presentations.where('title LIKE(?)', "%#{title}%")
    elsif title != ""
      Presentation.where('title LIKE(?)', "%#{title}%")
    elsif category_id != ""
      Presentation.where(category_id: category_id)
    else
      Presentation.all
    end
  end
end
