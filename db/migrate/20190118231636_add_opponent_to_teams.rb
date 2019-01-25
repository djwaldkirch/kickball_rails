class AddOpponentToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :opponent, :string
  end
end
