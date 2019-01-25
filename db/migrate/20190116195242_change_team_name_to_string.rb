class ChangeTeamNameToString < ActiveRecord::Migration[5.2]
  def change
    change_column :teams, :name, :string
  end
end
