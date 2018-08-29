class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :description
      t.string :released_on
      t.decimal :total_gross

      t.timestamps
    end
  end
end
