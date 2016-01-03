class CreatePreOrders < ActiveRecord::Migration
  def change
    create_table :pre_orders do |t|
      t.belongs_to :track

      #t.has_one :base_order
      t.belongs_to :carrier

      #t.timestamps null: false
    end
  end
end
