require 'rails_helper'

RSpec.describe Opinion, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    @opinion = FactoryBot.build(:opinion, user_id: user.id)
  end

  describe "opinionの保存" do
    context "opinionの保存ができる" do
      it "情報が全てあれば入力できる" do
        expect(@opinion).to be_valid
      end
    end

    context "opinionが保存できない" do
      it "titleが空である" do
        @opinion.title = ""
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("Title can't be blank")
      end
      it "contentが空である" do
        @opinion.content = ""
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("Content can't be blank")
      end
      it "user_idが紐づいていない" do
        @opinion.user_id = ""
        @opinion.valid?
        expect(@opinion.errors.full_messages).to include("User must exist")
      end
    end
  end
end
