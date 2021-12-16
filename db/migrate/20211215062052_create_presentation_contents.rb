class CreatePresentationContents < ActiveRecord::Migration[6.0]
  def change
    create_table :presentation_contents do |t|
      t.integer :page, null: false
      t.string :content, null: false
      t.text :text, null: false
      t.references :presentation, null: false, foreign_key: true
      t.timestamps
    end
  end
end