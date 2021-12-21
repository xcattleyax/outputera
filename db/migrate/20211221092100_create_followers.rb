class CreateFollowers < ActiveRecord::Migration[6.0]
  def change
    create_table :followers do |t|
      t.integer :follow_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
