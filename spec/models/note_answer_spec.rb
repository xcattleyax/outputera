require 'rails_helper'

RSpec.describe NoteAnswer, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    note = FactoryBot.build(:note, user_id: user.id)
    note.save
    @answer = FactoryBot.build(:note_answer, user_id: user.id, note_id: note.id)
  end

  describe "解答を保存する" do
    context "解答が保存できる" do
      it "全ての情報を入力していれば保存できる" do
        expect(@answer).to be_valid
      end
    end

    context "解答が保存できない" do
      it "contentが空である" do
        @answer.content = ""
        @answer.valid?
        expect(@answer.errors.full_messages).to include("Content can't be blank")
      end
      it "textが空である" do
        @answer.text = ""
        @answer.valid?
        expect(@answer.errors.full_messages).to include("Text can't be blank")
      end
      it "textが1000文字を超える" do
        @answer.text = 'a' * 1001
        @answer.valid?
        expect(@answer.errors.full_messages).to include("Text is too long (maximum is 1000 characters)")
      end
      it "user_idが紐づいていない" do
        @answer.user_id = ""
        @answer.valid?
        expect(@answer.errors.full_messages).to include("User must exist")
      end
      it "note_idが紐づいていない" do
        @answer.note_id = ""
        @answer.valid?
        expect(@answer.errors.full_messages).to include("Note must exist")
      end
    end
  end
end
