class CreatePresentations < ActiveRecord::Migration[6.0]
  def change
    create_table :presentations do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.integer :detail_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
