require 'rails_helper'

RSpec.describe Presentation, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    @presentation = FactoryBot.build(:presentation, user_id: user.id)
  end

  describe 'presentationの保存' do
    context '保存できる' do
      it '全ての情報が正しくある' do
        expect(@presentation).to be_valid
      end
    end

    context '保存できない' do
      it 'titleが空である' do
        @presentation.title = ''
        @presentation.valid?
        expect(@presentation.errors.full_messages).to include("Title can't be blank")
      end
      it 'category_idが空である' do
        @presentation.category_id = 1
        @presentation.valid?
        expect(@presentation.errors.full_messages).to include("Category can't be blank")
      end
      it 'detail_idが空である' do
        @presentation.detail_id = ''
        @presentation.valid?
        expect(@presentation.errors.full_messages).to include("Detail can't be blank")
      end
      it 'userが紐づいていない' do
        @presentation.user_id = ''
        @presentation.valid?
        expect(@presentation.errors.full_messages).to include('User must exist')
      end
    end
  end
end
