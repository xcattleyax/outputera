class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'プログラミング' },
    { id: 3, name: '経済' },
    { id: 4, name: '数学' },
    { id: 5, name: '資格' },
    { id: 6, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :diaries
end
