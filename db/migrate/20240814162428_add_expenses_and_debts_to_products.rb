class AddExpensesAndDebtsToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :expenses, :decimal
    add_column :products, :debts, :decimal
  end
end
