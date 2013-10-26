class RemoveRemoveEventsAndScores < ActiveRecord::Migration
  def change
    Score.delete_all
    Event.delete_all
  end
end
