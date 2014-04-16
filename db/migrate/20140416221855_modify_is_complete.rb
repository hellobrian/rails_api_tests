class ModifyIsComplete < ActiveRecord::Migration
  def change
    remove_column :goals, :is_complete?, :boolean
    add_column :goals, :is_complete, :boolean
  end
end
