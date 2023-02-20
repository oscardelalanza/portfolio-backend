class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.integer :content, null: false
      t.string :units, null: false
      t.string :version
      t.string :gender
      t.string :category, null: false
      t.string :description
      t.string :sku
      t.string :asin

      t.timestamps
    end

    add_index :products, :sku, unique: true, where: 'sku IS NOT NULL'
    add_index :products, :asin, unique: true, where: 'asin IS NOT NULL'
    add_index :products, :category
  end
end
