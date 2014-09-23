class CreatePartyPeople < ActiveRecord::Migration
  def change
    create_table :party_people do |t|
      t.string :name
      t.string :awesomeAttribute

      t.timestamps
    end
  end
end
