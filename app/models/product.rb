class Product < ApplicationRecord
  def money_in
    (opening_stock.to_i - closing_stock.to_i) * price.to_f
  end
  def net_amount
    money_in - (expenses.to_f + debts.to_f)
  end
end
