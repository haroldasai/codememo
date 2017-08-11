class AddAppVersionToCommands < ActiveRecord::Migration
  def change
    add_column :commands, :app_version, :string
  end
end
