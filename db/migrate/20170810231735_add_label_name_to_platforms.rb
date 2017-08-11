class AddLabelNameToPlatforms < ActiveRecord::Migration
  def change
    add_column :platforms, :label_name, :string
  end
end
