class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :tracks, :albums
    add_foreign_key :tracks, :genres
    add_foreign_key :tracks, :authors

    #add_foreign_key :tracks, :pre_orders
    #add_foreign_key :tracks, :base_orders

    add_foreign_key :tracks, :artists

    add_foreign_key :albums, :artists

    add_foreign_key :pre_orders, :tracks

    #add_foreign_key :base_orders, :pre_orders

    add_foreign_key :pre_orders, :carriers


  end
end
