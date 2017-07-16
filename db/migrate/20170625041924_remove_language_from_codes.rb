class RemoveLanguageFromCodes < ActiveRecord::Migration
  def change
  	remove_column :codes, :language
  	add_column :codes, :language_id, :integer
  	add_index :codes, :language_id
  end
end
