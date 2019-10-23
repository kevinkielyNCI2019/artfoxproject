class AddNameToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :c_name, :string
    add_column :customers, :c_phonenumber, :string
    add_column :customers, :c_paypal, :string
  end
end
