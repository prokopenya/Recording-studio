class CreateBaseOrders < ActiveRecord::Migration
  def change
    create_table :base_orders do |t|
      t.string :check

      t.timestamps null: false
    end
  end
end
