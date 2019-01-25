class DropPlayersFromTeam < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :players
  end
end
