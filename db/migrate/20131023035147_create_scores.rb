class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :player
      t.integer :rank
      t.references :game, index: true
      t.references :partyPerson, index: true

      t.timestamps
    end
  end
end
