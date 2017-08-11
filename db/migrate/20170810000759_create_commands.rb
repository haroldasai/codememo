class CreateCommands < ActiveRecord::Migration
  def change
    create_table :commands do |t|
      t.text :description
      t.text :command
      t.text :url
      t.references :tip, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
