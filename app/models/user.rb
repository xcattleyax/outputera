class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :trends
  has_many :diaries
  has_many :notes
  has_many :presentations
  has_many :note_comments

  validates :name, presence: true
end
