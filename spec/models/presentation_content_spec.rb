require 'rails_helper'

RSpec.describe PresentationContent, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    presentation = FactoryBot.build(:presentation, user_id: user.id)
    presentation.save
    @content = FactoryBot.build(:presentation_content, presentation_id: presentation.id)
    sleep 0.1
  end

  describe 'presentation_contentへの保存' do
    context '保存ができる' do
      it '全てが正しく入力されていれば保存できる' do
        expect(@content).to be_valid
      end
    end

    context '保存ができない' do
      it 'pageが空である' do
        @content.page = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Page can't be blank")
      end
      it 'contentが空である' do
        @content.content = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Content can't be blank")
      end
      it 'textが空である' do
        @content.text = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Text can't be blank")
      end
      it 'presentationが紐づいていない' do
        @content.presentation_id = ''
        @content.valid?
        expect(@content.errors.full_messages).to include('Presentation must exist')
      end
    end
  end
end
