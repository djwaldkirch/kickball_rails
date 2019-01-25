class AddGamesToInnings < ActiveRecord::Migration[5.2]
  def change
    add_reference :innings, :game, foreign_key: true
  end
end
