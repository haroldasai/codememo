class AddUserToCommands < ActiveRecord::Migration
  def change
    add_reference :commands, :user, index: true, foreign_key: true
  end
end
