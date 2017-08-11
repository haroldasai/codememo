class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :version
      t.text :description

      t.timestamps null: false
    end
  end
end
