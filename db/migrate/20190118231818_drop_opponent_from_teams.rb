class DropOpponentFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :opponent
  end
end
