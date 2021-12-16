require 'rails_helper'

RSpec.describe Note, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    @note = FactoryBot.build(:note, user_id: user.id)
  end

  describe 'ノートの保存' do
    context 'ノートの保存ができる' do
      it '入力が正しくされていれば保存できる' do
        expect(@note).to be_valid
      end
    end

    context 'ノートが保存できない' do
      it 'titleが空である' do
        @note.title = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Title can't be blank")
      end
      it 'textが空である' do
        @note.text = ''
        @note.valid?
        expect(@note.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが1000字以上である' do
        @note.text = 'a' * 1001
        @note.valid?
        expect(@note.errors.full_messages).to include('Text is too long (maximum is 1000 characters)')
      end
      it 'category_idが空である' do
        @note.category_id = 1
        @note.valid?
        expect(@note.errors.full_messages).to include("Category can't be blank")
      end
      it 'userが紐づいていない' do
        @note.user_id = ''
        @note.valid?
        expect(@note.errors.full_messages).to include('User must exist')
      end
    end
  end
end
