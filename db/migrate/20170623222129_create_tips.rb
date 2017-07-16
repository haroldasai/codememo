class CreateTips < ActiveRecord::Migration
  def change
    create_table :tips do |t|
      t.string :title
      t.text :description
      t.integer :topic_id

      t.timestamps null: false
    end
    add_index :tips, :topic_id
  end
end
