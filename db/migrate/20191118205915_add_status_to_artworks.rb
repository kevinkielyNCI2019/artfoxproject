class AddStatusToArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :status, :string
  end
end
