class AddActiveToPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :active, :boolean
  end
end
