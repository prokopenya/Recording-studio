class CreateTypeCarriers < ActiveRecord::Migration
  def change
    create_table :type_carriers do |t|
      t.string :name
      t.integer :price_of_record
      t.time :max_duration
      t.integer :capacity
      #t.timestamps null: false
    end
  end
end
