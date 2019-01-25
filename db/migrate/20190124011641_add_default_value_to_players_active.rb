class AddDefaultValueToPlayersActive < ActiveRecord::Migration[5.2]
  def up
    change_column :players, :active, :boolean, default: true
  end

  def down
    change_column :players, :active, :boolean, default: nil
  end
end
