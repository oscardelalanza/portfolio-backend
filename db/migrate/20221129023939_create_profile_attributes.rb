class CreateProfileAttributes < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_attributes do |t|
      t.references :profile, null: false, foreign_key: true

      t.string :key, null: false, limit: 20
      t.string :value, null: false
      t.string :description, limit: 255
      t.boolean :visible, null: false, default: true

      t.timestamps
    end
  end
end
