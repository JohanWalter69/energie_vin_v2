class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.float :price
      t.string :type
      t.string :image_url
      t.string :origin

      t.timestamps
    end
  end
end
