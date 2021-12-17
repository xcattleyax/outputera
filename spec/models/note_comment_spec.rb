require 'rails_helper'

RSpec.describe NoteComment, type: :model do
  before do
    user = FactoryBot.build(:user)
    user.save
    note = FactoryBot.build(:note, user_id: user.id)
    note.save
    @comment = FactoryBot.build(:note_comment, user_id: user.id, note_id: note.id)
  end

  describe "コメントの保存" do
    context "コメントが保存できる" do
      it "データがあれば保存できる" do
        expect(@comment).to be_valid
      end
    end

    context "コメントが保存できない" do
      it "コメントが空である" do
        @comment.comment = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Comment can't be blank")
      end
      it "user_idが空である" do
        @comment.user_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")
      end
      it "note_idが空である" do
        @comment.note_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Note must exist")
      end
      it "status_idが空である" do
        @comment.status_id = ""
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Status can't be blank")
      end
    end
  end
end