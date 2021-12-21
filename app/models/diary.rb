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
    order_notes = Note.all.order('created_at DESC')
    if category_id != '1' && title != ''
      notes = order_notes.where(category_id: category_id)
      notes.where('title LIKE(?)', "%#{title}%")
    elsif category_id == '1' && title == ''
      order_notes
    elsif title != ''
      order_notes.where('title LIKE(?)', "%#{title}%")
    else
      order_notes.where(category_id: category_id)
    end
  end

  def self.presentation_search(category_id, title)
    release_presentations = Presentation.where(detail_id: 2).order('created_at DESC')
    if category_id != '1' && title != ''
      presentations = release_presentations.where(category_id: category_id)
      presentations.where('title LIKE(?)', "%#{title}%")
    elsif category_id == '1' && title == ''
      release_presentations
    elsif title != ''
      release_presentations.where('title LIKE(?)', "%#{title}%")
    else
      release_presentations.where(category_id: category_id)
    end
  end
end
