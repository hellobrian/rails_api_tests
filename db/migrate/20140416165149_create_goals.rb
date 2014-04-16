class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :description
      t.string :motivation
      t.date :completion_date
      t.boolean :is_complete?

      t.timestamps
    end
  end
end
