class AddGeocodingColumnToPosts < ActiveRecord::Migration[8.0]
  def change
    add_column :posts, :latitude, :float
    add_column :posts, :longitude, :float
  end
end
