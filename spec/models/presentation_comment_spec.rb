require 'rails_helper'

RSpec.describe PresentationComment, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    presentation = FactoryBot.build(:presentation, user_id: user.id)
    presentation.save
    @comment = FactoryBot.build(:presentation_comment, user_id: user.id, presentation_id: presentation.id)
  end

  describe 'コメントの保存' do
    context 'コメントが保存できる' do
      it 'データがあれば保存できる' do
        expect(@comment).to be_valid
      end
    end

    context 'コメントが保存できない' do
      it 'コメントが空である' do
        @comment.comment = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end
      it 'user_idが空である' do
        @comment.user_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'presentation_idが空である' do
        @comment.presentation_id = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Presentation must exist')
      end
    end
  end
end
