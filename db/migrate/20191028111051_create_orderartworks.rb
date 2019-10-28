class CreateOrderartworks < ActiveRecord::Migration[5.2]
  def change
    create_table :orderartworks do |t|
      t.integer :artwork_id
      t.string :title
      t.string :cat
      t.text :desc
      t.decimal :price
      t.boolean :sold
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
