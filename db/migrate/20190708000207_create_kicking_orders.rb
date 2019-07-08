class CreateKickingOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :kicking_orders do |t|
      t.references :game, foreign_key: true
      t.text :order

      t.timestamps
    end
  end
end
