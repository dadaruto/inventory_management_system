class CreateDebts < ActiveRecord::Migration[7.1]
  def change
    create_table :debts do |t|
      t.string :description
      t.decimal :amount, precision: 10, scale: 2

      t.timestamps
    end
  end
end
