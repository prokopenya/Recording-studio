class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :name
      t.string :country
      t.string :language_song

      #t.timestamps null: false
    end
  end
end
