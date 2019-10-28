class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :order_date
      t.references :customer, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
