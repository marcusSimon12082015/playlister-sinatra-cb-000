class CreateSongsGenres < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'songs_genres'
      drop_table :songs_genres
    end
    create_table :song_genres, id: false do |t|
      t.belongs_to :song, index: true
      t.belongs_to :genre, index: true
    end
  end
end
