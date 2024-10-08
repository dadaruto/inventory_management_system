class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.string :size
      t.integer :opening_stock
      t.integer :closing_stock

      t.timestamps
    end
  end
end
