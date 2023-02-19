class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.integer :size, null: false
      t.string :units, null: false
      t.string :type
      t.string :gender
      t.string :category, null: false
      t.string :description
      t.string :sku
      t.string :asin

      t.timestamps
    end

    add_index :products, :sku
    add_index :products, :category
  end
end
