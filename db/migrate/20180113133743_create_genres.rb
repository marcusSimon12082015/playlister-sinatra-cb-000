class CreateGenres < ActiveRecord::Migration
  def change
    if ActiveRecord::Base.connection.table_exists? 'genres'
      drop_table :genres
    end
    create_table :genres do |t|
      t.string :name
    end
  end
end
