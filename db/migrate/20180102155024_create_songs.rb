class CreateSongs < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'songs'
      drop_table :songs
    end
    create_table :songs do |t|
      t.string :name
      t.integer :artist_id
    end
  end
end
