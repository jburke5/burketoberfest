class AddEventToScore < ActiveRecord::Migration
  def change
    add_column :scores, :event, :integer
  end
end
