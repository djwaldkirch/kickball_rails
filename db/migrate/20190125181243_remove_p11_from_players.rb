class RemoveP11FromPlayers < ActiveRecord::Migration[5.2]
  def change
    def up
      remove_column :players, :p11
    end
  
    def down
      add_column :players, :p11, :string
    end
  end
end
