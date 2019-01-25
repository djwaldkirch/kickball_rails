class AddOpponentAndDateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :opponent, :string
    add_column :games, :date, :date
  end
end
