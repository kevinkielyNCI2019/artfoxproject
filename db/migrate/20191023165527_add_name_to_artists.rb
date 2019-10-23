class AddNameToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :a_name, :string
    add_column :artists, :a_address, :string
    add_column :artists, :a_phonenumber, :string
    add_column :artists, :a_paypal, :string
  end
end
