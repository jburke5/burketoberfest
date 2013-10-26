class AddEventToScore < ActiveRecord::Migration
  def change
    add_column :scores, :event, :id
  end
end
