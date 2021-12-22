require 'rails_helper'

RSpec.describe Follower, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    @follower = FactoryBot.build(:follower, user_id: user.id)
  end

  describe "followerの保存" do
    context "保存できる" do
      it "全ての情報があれば保存できる" do
        expect(@follower).to be_valid
      end
    end

    context "保存できない" do
      it "follower_idが空である" do
        @follower.follow_id = ""
        @follower.valid?
        expect(@follower.errors.full_messages).to include("Follow can't be blank")
      end
      it "user_idが紐づいていない" do
        @follower.user_id = ""
        @follower.valid?
        expect(@follower.errors.full_messages).to include('User must exist')
      end
    end
  end
end
