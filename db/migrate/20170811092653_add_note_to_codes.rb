class AddNoteToCodes < ActiveRecord::Migration
  def change
    add_column :codes, :note, :text
  end
end
