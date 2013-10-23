class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string  :name
      t.integer  :players
      t.integer  :duration
      t.timestamps
    end
  end
end
