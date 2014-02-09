class AddPhotoUrlColToBuildingsTable < ActiveRecord::Migration
  def change
    add_column :buildings, :photo_url, :string
  end
end
