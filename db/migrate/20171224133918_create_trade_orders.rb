class CreateTradeOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :trade_orders do |t|
      t.integer :trade_id, null: false
      t.string :trade_type, null: false
      t.decimal :quantity, null: false
      t.integer :price, null: false
      t.decimal :amount, null: false
      t.integer :unix_date, null: false

      t.timestamps null: false
    end
  end
end
