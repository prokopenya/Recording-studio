class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name
      t.date :released

      t.belongs_to :artist
      #t.timestamps null: false
    end
  end
end
