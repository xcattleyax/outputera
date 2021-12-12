class CreateDiaries < ActiveRecord::Migration[6.0]
  def change
    create_table :diaries do |t|
      t.integer :time, null: false
      t.integer :category_id, null: false
      t.timestamps
    end
  end
end
