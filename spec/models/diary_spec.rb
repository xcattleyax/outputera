require 'rails_helper'

RSpec.describe Diary, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    @diary = FactoryBot.build(:diary, user_id: user.id)
  end

  describe "日記の保存" do
    context "日記が保存できる" do
      it "全ての情報があれば登録できる" do
        expect(@diary).to be_valid
      end
    end

    context "日記が保存できない" do
      it "dateが空では保存できない" do
        @diary.date = ""
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Date can't be blank")
      end
      it "timeが空では保存できない" do
        @diary.time = ""
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Time can't be blank")
      end
      it "category_idが空では保存できない" do
        @diary.category_id = 1
        @diary.valid?
        expect(@diary.errors.full_messages).to include("Category must be other than 1")
      end
      it "user_idが紐づいていなければ登録できない" do
        @diary.user_id = ""
        @diary.valid?
        expect(@diary.errors.full_messages).to include("User must exist")
      end
    end
  end
end
