class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.date :released
      t.string :poster_file_name
      t.string :poster_content_type
      t.integer :poster_file_size
      t.datetime :poster_updated_at

      t.timestamps
    end
  end
end
