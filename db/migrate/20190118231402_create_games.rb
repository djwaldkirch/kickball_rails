class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.integer :no_of_innings

      t.timestamps
    end
  end
end
