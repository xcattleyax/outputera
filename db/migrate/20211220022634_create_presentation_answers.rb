class CreatePresentationAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :presentation_answers do |t|
      t.string :content, null: false
      t.text :text, null: false
      t.references :user, null: false
      t.references :presentation, null: false
      t.timestamps
    end
  end
end
