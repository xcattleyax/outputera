class CreateNoteComments < ActiveRecord::Migration[6.0]
  def change
    create_table :note_comments do |t|
      t.string :comment, null: false
      t.references :user, null: false, foreign_key: true
      t.references :note, null: false, foreign_key: true
      t.integer :status_id, null: false
      t.timestamps
    end
  end
end
