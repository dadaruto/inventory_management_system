class AddMoreDetailsToProducts < ActiveRecord::Migration[7.1]
  def change
    # Check if column does not exist before adding it
    unless column_exists?(:products, :price)
      add_column :products, :price, :decimal, precision: 10, scale: 2
    end
    
    unless column_exists?(:products, :size)
      add_column :products, :size, :string
    end
    
    unless column_exists?(:products, :opening_stock)
      add_column :products, :opening_stock, :integer
    end
    
    unless column_exists?(:products, :closing_stock)
      add_column :products, :closing_stock, :integer
    end
  end
end
