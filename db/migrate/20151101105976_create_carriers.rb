class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :name
      #t.string :type_carrier
      #t.integer :price_of_record
      #t.time :max_duration
      #t.integer :capacity
      t.timestamps null: false, created_at: true, updated_at: false
      t.belongs_to :type_carrier
    end
  end
end
