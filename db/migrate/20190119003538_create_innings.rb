class CreateInnings < ActiveRecord::Migration[5.2]
  def change
    create_table :innings do |t|
      t.string :p
      t.string :c
      t.string :first
      t.string :third
      t.string :lr
      t.string :rr
      t.string :l
      t.string :lc
      t.string :rc
      t.string :r
      t.text :bench

      t.timestamps
    end
  end
end
