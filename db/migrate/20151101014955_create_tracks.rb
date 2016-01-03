class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.boolean :in_orders
      t.string :name
      t.integer :duration


      t.belongs_to :album
      t.belongs_to :genre
      t.belongs_to :author

      #t.belongs_to :pre_order
      #t.belongs_to :base_order

      t.belongs_to :artist

      #t.timestamps null: false
    end
  end
end
