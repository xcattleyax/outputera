require 'rails_helper'

RSpec.describe Trend, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    @trend = FactoryBot.build(:trend, user_id: user.id)
  end

  describe 'トレンドの保存' do
    context 'トレンドの保存ができる' do
      it '全ての情報が正しく入力されている' do
        expect(@trend).to be_valid
      end
    end

    context 'トレンドの保存ができない' do
      it 'category_idが空である' do
        @trend.category_id = 1
        @trend.valid?
        expect(@trend.errors.full_messages).to include("Category can't be blank")
      end
      it 'user_idが取得できていない' do
        @trend.user_id = ''
        @trend.valid?
        expect(@trend.errors.full_messages).to include('User must exist')
      end
    end
  end
end
