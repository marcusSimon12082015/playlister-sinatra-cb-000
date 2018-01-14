class CreateArtists < ActiveRecord::Migration
  def up
    if ActiveRecord::Base.connection.table_exists? 'artists'
      drop_table :artists
    end
    create_table :artists do |t|
      t.string :name
    end
  end

  def down
    drop_table :artists
  end
end
