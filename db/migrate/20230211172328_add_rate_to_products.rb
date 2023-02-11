class AddRateToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :rate, :float
  end
end
