class AddTeamToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_reference :players, :team, index:true
  end
end
