class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.text :body
      t.integer :tip_id
      t.integer :language

      t.timestamps null: false
    end
    add_index :codes, :tip_id
  end
end
