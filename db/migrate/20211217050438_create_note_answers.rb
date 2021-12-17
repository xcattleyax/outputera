class CreateNoteAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :note_answers do |t|
      t.string :content, null: false
      t.text :text, null: false
      t.references :user, null: false
      t.references :note, null: false
      t.timestamps
    end
  end
end
