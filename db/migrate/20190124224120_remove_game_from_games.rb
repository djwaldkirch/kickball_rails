class RemoveGameFromGames < ActiveRecord::Migration[5.2]
  def change
    remove_reference :games, :game, foreign_key: true
  end
end
