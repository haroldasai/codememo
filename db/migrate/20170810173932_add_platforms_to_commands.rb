class AddPlatformsToCommands < ActiveRecord::Migration
  def change
    add_column :commands, :platform_ids, :text
  end
end
