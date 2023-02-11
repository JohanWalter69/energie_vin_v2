class RemoveTypeFromProduct < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :type, :string
  end
end
